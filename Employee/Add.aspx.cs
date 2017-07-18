using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    GreatBooksDBEntities context;
    Book book;
    Author aut;
    Publisher pub;
    BookFormat bkFormat;
    Language lang;
    BookCategory bkCat;

    protected void Page_Load(object sender, EventArgs e)
    {
        context = new GreatBooksDBEntities();
        book = new Book();

    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {




        if (fuImage.HasFile)
        {
            try
            {
                aut = context.Authors.Where(x => x.AuthorName == ddlAuthor.SelectedValue).First();
                pub = context.Publishers.Where(x => x.PublisherName == ddlPublisher.SelectedValue).First();
                lang = context.Languages.Where(x => x.LanguageName == ddlLanguage.SelectedValue).First();
                bkFormat = context.BookFormats.Where(x => x.FormatName == ddlFormat.SelectedValue).First();
                bkCat = context.BookCategories.Where(x => x.CategoryName == ddlCategory.SelectedValue).First();

                book.Title = tbTitle.Text;
                book.AuthorID = aut.AuthorID;
                book.ISBN = tbISBN.Text;
                book.Price = decimal.Parse(tbPrice.Text);
                book.PublisherID = pub.PublisherID;
                book.Quantity = Int32.Parse(tbQuantity.Text);
                book.PublishedDate = Convert.ToDateTime(tbPublishedDate.Text);
                book.Description = tbDescript.Text;
                book.Pages = Int32.Parse(tbPages.Text);
                book.LanguageID = lang.LanguageID;
                book.FormatID = bkFormat.FormatID;
                book.CategoryID = bkCat.CategoryID;
                book.AddedDate = DateTime.Now;
                book.DeletedFlag = "N";

                string filename = string.Format(tbISBN.Text + ".jpg");
                fuImage.SaveAs(Server.MapPath("~/BookCover/" + filename));

                context.Books.Add(book);
                context.SaveChanges();

                Response.Redirect("Complete_Add.aspx?key=" + tbISBN.Text);

            }
            catch (Exception ex)
            {

                //catch exceptions whereby image file is not specified
            }
        }
    }
}