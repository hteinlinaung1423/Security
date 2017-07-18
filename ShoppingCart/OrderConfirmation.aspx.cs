using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderConfirmation : System.Web.UI.Page
{

    double GST = 0.07;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cart cart = Session["cart"] as Cart;

            if (cart == null || cart.TotalNumberOfBooks == 0)
            {
                LabelOrderSummary.Text = "Your cart is empty.";
                Panel_Footer.Visible = false;
                // Redirect back to cart page
                Response.Redirect("Cart.aspx");
            }
            else
            {
                UpdateCartContentsView( GetBookViewsFromCart(cart) );
            }
        }
    }

    private void UpdateCartContentsView(List<BookView> cartBooks)
    {
        Cart cart = Session["cart"] as Cart;

        double subTotal = cart.TotalPrice;
        double gstPrice = subTotal * GST;
        double totalPrice = subTotal * 0.8;//gstPrice + subTotal;
        double userCredits;
        string username = User.Identity.Name;

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            userCredits = Convert.ToDouble( context.Customers.Find(username).CreditAmount );// Where(x => x.CustomerUserName == username).First();
        }

        Label_Subtotal.Text = displayAsCurrency(subTotal);
        Label_GST.Text = "20%";//displayAsCurrency(gstPrice);
        Label_TotalToPay.Text = displayAsCurrency(totalPrice);
        Label_CreditInAccount.Text = displayAsCurrency(userCredits);
        Label_CreditAfterPurchase.Text = displayAsCurrency(userCredits - totalPrice);

        LabelOrderSummary.Text = string.Format("You have {0} items, that total up to {1} in your cart.", cart.TotalNumberOfBooks, displayAsCurrency(cart.TotalPrice));

        if (userCredits - totalPrice < 0)
        {
            Button_PayNow.Text = "Not enough credits";
            Button_PayNow.CssClass = "btn width-wide";
            Button_PayNow.Enabled = false;
        }

        RepeaterCartContents.DataSource = cartBooks;
        RepeaterCartContents.DataBind();
    }

    public string displayAsCurrency(double amount)
    {
        return string.Format("${0:0.00}", amount);
    }

    protected void Button_PayNow_Click(object sender, EventArgs e)
    {
        Cart cart = Session["cart"] as Cart;

        double totalPrice = (cart.TotalPrice * GST) + cart.TotalPrice;
        List<BookView> cartBooks = GetBookViewsFromCart(cart);

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            // Deduct credits
            string username = User.Identity.Name;
            Customer customer = context.Customers.Find(username);
            if (Convert.ToDouble(customer.CreditAmount) < totalPrice)
            {
                return;
            }

            // Reduce quantity of books
            foreach (BookView bookView in cartBooks)
            {
                Book book = context.Books.Find(bookView.ISBN);
                if (book.Quantity < bookView.Quantity)
                {
                    Label_Footer_Header.Text = "Not enough stock of books.";
                    return;
                }
                book.Quantity = book.Quantity - bookView.Quantity;
            }

            customer.CreditAmount = Convert.ToDecimal(Convert.ToDouble(customer.CreditAmount) - totalPrice);

            DateTime timestamp = DateTime.Now;

            // Create new Order
            Order order = new Order();
            order.CustomerUserName = User.Identity.Name;
            order.OrderDate = timestamp;
            order.OrderStatus = "Order placed";

            context.Orders.Add(order);

            context.SaveChanges();

            // Get OrderID
            DateTime timestampDate = timestamp.Date;
            Order createdOrder = context.Orders.Where(x => x.CustomerUserName == User.Identity.Name).OrderBy(o => o.OrderID).ToList().Last();

            int latestODid = 1;
            List<OrderDetail> odList = context.OrderDetails.ToList();

            if (odList.Count > 0)
            {
                odList.OrderBy(x => x.OrderDetailsID);
                latestODid = odList.Last().OrderDetailsID;
                latestODid += 1;
            }

            foreach (BookView bookView in cartBooks)
            {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.OrderDetailsID = latestODid;
                orderDetail.OrderID = createdOrder.OrderID;
                orderDetail.ISBN = bookView.ISBN;
                orderDetail.Quantity = bookView.Quantity;

                context.OrderDetails.Add(orderDetail);
                latestODid++;
            }
                context.SaveChanges();
            // Save orders
        }
        // Clear cart
        Session["cart"] = null;

        Label_Footer_Header.Text = "Payment Successful!";
        Button_PayNow.Text = "Go to order history";
        Button_PayNow.CssClass = "btn btn-success width-wide";
        Button_PayNow.PostBackUrl = "~/Order/OrderHistory.aspx";
       // Button_PayNow.Enabled = false;  
        //Response.Redirect("OrderSuccess.aspx");
    }

    private List<BookView> GetBookViewsFromCart(Cart cart)
    {
        List<BookView> cartBooks = new List<BookView>();

        foreach (Book book in cart.GetAllBooks().Distinct().OrderBy(x => x.Title))
        {
            int quantity = cart.GetNumberOfBooksWithISBN(book.ISBN);
            BookView bv = new BookView(book, quantity);
            cartBooks.Add(bv);
        }
        return cartBooks;
    }
}