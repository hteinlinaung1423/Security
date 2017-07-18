using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CartView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cart cart = Session["cart"] as Cart;

            if (cart == null || cart.TotalNumberOfBooks == 0)
            {
                LabelOrderSummary.Text = "Your cart is empty.";
                Button_CheckoutTop.Enabled = false;
                Button_CheckoutBottom.Enabled = false;
                Panel_Footer.Visible = false;
            }
            else
            {
                UpdateOrderSummary(cart);
                Button_InitCart.Enabled = false;
                Button_InitCart.Visible = false;

                List<BookView> cartBooks = new List<BookView>();

                foreach (Book book in cart.GetAllUniqueBooks().OrderBy(x => x.Title))
                {
                    int quantity = cart.GetNumberOfBooksWithISBN(book.ISBN);
                    BookView bv = new BookView(book, quantity);
                    cartBooks.Add(bv);
                }

                UpdateCartContentsView(cartBooks);
            }
        }
    }
    private void UpdateCartContentsView(List<BookView> cartBooks)
    {
        Cart cart = Session["cart"] as Cart;

        LabelTotalCost.Text = displayAsCurrency(cart.TotalPrice);
        RepeaterCartContents.DataSource = cartBooks;
        RepeaterCartContents.DataBind();
    }
    public string displayAsCurrency(double amount)
    {
        return string.Format("${0:0.00}", amount);
    }

    private void UpdateOrderSummary(Cart cart)
    {
        string newText = string.Format("You have {0} items, that total up to {1} in your cart.", cart.TotalNumberOfBooks, displayAsCurrency(cart.TotalPrice));
        LabelOrderSummary.Text = newText;
        LabelOrder_SummaryFooter.Text = newText;
        LabelTotalCost.Text = displayAsCurrency(cart.TotalPrice);

    }

    protected void RepeaterCartContents_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DropDownList listQuantity = e.Item.FindControl("DropDownList_Quantity") as DropDownList;
            listQuantity.SelectedValue = (e.Item.DataItem as BookView).Quantity.ToString();
        }
    }

    protected void DropDownList_Quantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string isbn = ((sender as DropDownList).Parent.FindControl("Label_Quantity_hidden") as Label).Text;
        int quantity = Convert.ToInt32((sender as DropDownList).SelectedValue);
        Label_DEBUG.Text = isbn + ", " + quantity;
        // update cart
        Cart cart = Session["cart"] as Cart;
        cart.SetQuantityOfBook(isbn, quantity);
        // save cart
        Session["cart"] = cart;

        Cart gotCart = Session["cart"] as Cart;
        Label_DEBUG.Text += ": " + gotCart.TotalNumberOfBooks;

        Book currentBook = cart.GetAllBooks().Where(x => x.ISBN == isbn).First();

        Label lbl_subtotal = ((sender as DropDownList).Parent.Parent.Parent.FindControl("Label_Subtotal") as Label);

        lbl_subtotal.Text = displayAsCurrency( Convert.ToDouble(quantity * currentBook.Price) );

        UpdateOrderSummary(cart);
        //LabelOrderSummary.Text = string.Format(orderSummaryString, cart.TotalNumberOfBooks, displayAsCurrency(cart.TotalPrice));

        Label_DEBUG.Text += " / " + ((sender as DropDownList).Parent.Parent.Parent.FindControl("Label_Subtotal") as Label).Text;//ID;
    }

    protected void ButtonRemove_Click(object sender, EventArgs e)
    {
        string isbn = ((sender as Button).Parent.FindControl("Label_Remove_hidden") as Label).Text;
        Cart cart = Session["cart"] as Cart;
        cart.SetQuantityOfBook(isbn, 0);
        Session["cart"] = cart;
        Response.Redirect("Cart.aspx");
    }

    protected void Button_InitCart_Click(object sender, EventArgs e)
    {
        List<Book> books = new List<Book>();

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            books = context.BookCategories.Where(x => x.CategoryName == "Children").First().Books.ToList();
        }

        Cart newCart = new Cart(books);
        Session["cart"] = newCart;
        Response.Redirect("Cart.aspx");
    }
}