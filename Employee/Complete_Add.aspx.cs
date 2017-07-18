using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Complete_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GreatBooksDBEntities context = new GreatBooksDBEntities();
        string isbn = Request.QueryString["key"];
        Book book = context.Books.Where(x => x.ISBN == isbn).First();
        Author aut = context.Authors.Where(x => x.AuthorID == book.AuthorID).First();


        imgAdd.ImageUrl = "~/BookCover/" + Request.QueryString["key"] + ".jpg";
        lblTitle.Text = book.Title;
        lblAuthor.Text = aut.AuthorName;
        lblISBN.Text = book.ISBN;
        lblPrice.Text = book.Price.ToString();
        lblQuantity.Text = book.Quantity.ToString();

    } 
}