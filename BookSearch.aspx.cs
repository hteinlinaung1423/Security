using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookSearch : System.Web.UI.Page
{
    string test = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
                 test = Session["Value"].ToString();
                ((TextBox)Master.FindControl("tbxSearch")).Text = test;
               // LabelKeyword.Text = test;              
                AAA();
        }

    }
    public void AAA()
    {
  
        GreatBooksDBEntities ctx = new GreatBooksDBEntities();

        // get isbn (Databse)
        List<string> databseISBNList = ctx.Books.Where(x => x.Quantity == 0).Select(x => x.ISBN).ToList();
        string[] DbIsbnArray = new string[databseISBNList.Count];
           int g = 0;
            foreach (string items in databseISBNList)
            {
                DbIsbnArray[g] = items;
            g++;
            }

        //get isbn(gridview)
        int totalRowCount = ctx.Books.Select(x => x.ISBN).Count(); //47
        string[] GVIsbnArray = new string[totalRowCount]; //47

        int h = 0;
        foreach (GridViewRow row in GridView1.Rows)
        {
            GVIsbnArray[h] = row.Cells[2].Text;
            h++;
        }

        ////compare isbn(gridview) & isbn(databse)
        for (int i = 0; i < totalRowCount; i++) 
        {
            for (int j = 0; j < DbIsbnArray.Length; j++) 
            {
                if (GVIsbnArray[i] == DbIsbnArray[j])
                {
                    TextBox txb = (TextBox)GridView1.Rows[i].FindControl("TextBoxQuantity");
                    txb.ReadOnly = true;//if zero Quantity
                    txb.BackColor = System.Drawing.Color.LightGray;//if zero Quantity

                    Button btn = (Button)GridView1.Rows[i].FindControl("AddtoCartBtn");
                    btn.Visible = false;

                }
            }
        }
    }

    //read more
    protected string Limit(object desc, int maxLength)
    {
        var description = (string)desc;
        if (string.IsNullOrEmpty(description)) { return description; }
        return description.Length <= maxLength ?
            description : description.Substring(0, maxLength) + "...";
    }
    protected bool SetVisibility(object desc, int maxLength)
    {
        var description = (string)desc;
        if (string.IsNullOrEmpty(description)) { return false; }
        return description.Length > maxLength;
    }

    protected void ReadMoreLinkButton_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;
        GridViewRow row = button.NamingContainer as GridViewRow;
        Label descLabel = row.FindControl("DescriptionLabel") as Label;

        button.Text = (button.Text == "Read More") ? "Hide" : "Read More";
        string temp = descLabel.Text;

        descLabel.Text = descLabel.ToolTip;
        descLabel.ToolTip = temp;
    }


    protected void AddtoCartBtn_Click(object sender, EventArgs e)
    {
        //To link with cart.cs
    }


}

