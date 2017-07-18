using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["ISBN"]))
            {
                string CustomerUserName = User.Identity.Name;
                string id = Request.QueryString["ISBN"];
                int amount = Convert.ToInt32(ddlAmount.SelectedValue);
                Book book = new BookModel().GetBook(id);
                // Get current cart
                Cart cart = (Cart) Session["cart"];
                if (cart == null)
                {
                    cart = new Cart();
                }

                // Add book
                for (int i = 0; i < amount; i++)
                {
                    cart.AddBook(book);
                }
               
                Session["cart"] = cart;
                lblResult.Text = "Added " + amount + " Successfully";
                Button1.Visible = true;
            }
        }
        else { Response.Redirect("~/login.aspx"); }
           
        


    }
    private void FillPage()
    {
        //get book data
        if (!String.IsNullOrWhiteSpace(Request.QueryString["ISBN"]))
        {
            GreatBooksDBEntities context = new GreatBooksDBEntities();

            string id = Request.QueryString["ISBN"];
            BookModel model = new BookModel();
            Book book = model.GetBook(id);

            Author aut = context.Authors.Where(x => x.AuthorID == book.AuthorID).First();
            Publisher publish = context.Publishers.Where(x => x.PublisherID == book.PublisherID).First();

            //fill page with data
            lblTitle.Text = book.Title;
            lblDesc.Text = book.Description;
            //Literal_Desc.Text = book.Description;
            lblPrice.Text = "Price: $ " + book.Price;
            lblisbn.Text = book.ISBN;
            string url = "BookCover/" + id + ".jpg";
            imgbook.ImageUrl = url;
            lblAuthor.Text = aut.AuthorName;
            lblpublishedDate.Text = book.PublishedDate.ToString();
            lblpublisher.Text = publish.PublisherName;
            lblpages.Text = book.Pages.ToString();

            //fill amount list
            int q = Convert.ToInt32(book.Quantity);
            if (q == 0)
            {
                ddlAmount.Enabled = false;
                btnAdd.Enabled = false;
            }
            else if (q == 1)
            {
                ddlAmount.DataSource = 1;
            }
            else
            {
                int[] amount = Enumerable.Range(1, q).ToArray();
                ddlAmount.DataSource = amount;
                ddlAmount.AppendDataBoundItems = true;
                ddlAmount.DataBind();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ShoppingCart/Cart.aspx");
    }
}
