using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderHistoryDetail : System.Web.UI.Page
{
    GreatBooksDBEntities context;
    List<OrderDetail> details;
    Book book;
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new GreatBooksDBEntities();
        id = Int32.Parse(Request.QueryString["key"]);

        Order order = context.Orders.Where(x => x.OrderID == id).First();
        lbOrderID.Text = Convert.ToString(order.OrderID);
        lbOrderDate.Text = Convert.ToString(order.OrderDate);
        lbOrderStatus.Text = order.OrderStatus;

        details = context.OrderDetails.Where(x => x.OrderID == id).ToList();
        List<OrderDetailsView> orderDetailViews = new List<OrderDetailsView>();

        foreach (OrderDetail detail in details)
        {
            orderDetailViews.Add(new OrderDetailsView(detail));
        }

        RepeaterOrderDetails.DataSource = orderDetailViews;
        RepeaterOrderDetails.DataBind();
    }
}

class OrderDetailsView
{
    string imagePath, title, author, format;
    double price;
    int quantity;

    public OrderDetailsView(OrderDetail order)
    {
        fillFields(order);
        quantity = order.Quantity;
    }

    public string ImagePath { get { return imagePath; } }
    public string Title { get { return title; } }
    public string Author { get { return author; } }
    public string Format { get { return format; } }
    public double Price { get { return price; } }
    public int Quantity { get { return quantity; } }

    private void fillFields(OrderDetail order)
    {
        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            Book book = context.Books.Where(x => x.ISBN == order.ISBN).First();//Find(order.ISBN);

            title = book.Title;
            imagePath = book.ISBN + ".jpg";
            price = Convert.ToDouble(book.Price);
            format = context.BookFormats.Find(book.FormatID).FormatName;
            author = context.Authors.Find(book.AuthorID).AuthorName;
        }
    }
}