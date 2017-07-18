using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookSearch2 : System.Web.UI.Page
{
    string test = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
                 test = Session["Value"].ToString();
                ((TextBox)Master.FindControl("tbxSearch")).Text = test;
                LabelKeyword.Text = test;              
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

    //LInk to details
    public void linkGoSomewhere_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow row = btn.NamingContainer as GridViewRow;

        string course = GridView1.DataKeys[row.RowIndex].Value.ToString();
        Session["ABC"] = course;
        Response.Redirect("Details.aspx?isbn="+course);
    }
    protected void AddtoCartBtn_Click(object sender, EventArgs e)
    {
        //To link with cart.cs
    }


}

