using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

public partial class MasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        IIdentity id= Page.User.Identity;

        Button12.UseSubmitBehavior = false;
        btnSearch.UseSubmitBehavior = false;
        Button1.UseSubmitBehavior = false;
        Button1.UseSubmitBehavior = false;
        Button2.UseSubmitBehavior = false;
        Button3.UseSubmitBehavior = false;
        Button4.UseSubmitBehavior = false;

        Button5.UseSubmitBehavior = false;
        Button6.UseSubmitBehavior = false;
        Button13.UseSubmitBehavior = false;
        Button14.UseSubmitBehavior = false;




    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
     
    //    string url = TextBox1.Text;
    //    Response.Redirect("~/Search.aspx?key="+url);
    //}


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Order/OrderHistory.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ShoppingCart/Cart.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/logout.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Profile/MyProfile.aspx");
    }

   

    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Value"] = tbxSearch.Text;
        Response.Redirect("~/BookSearch2.aspx");
    }



    protected void tbxSearch_TextChanged(object sender, EventArgs e)
    {
        Session["Value"] = tbxSearch.Text;
        Response.Redirect("~/BookSearch2.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employee/Add.aspx");
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Employee/EditBooks.aspx");
    }

    protected void Button14_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Profile/MockPaymentGateway.aspx");
    }
}
