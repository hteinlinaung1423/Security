using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile_MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        string name = User.Identity.Name.ToString();
        GreatBooksDBEntities ctx = new GreatBooksDBEntities();
        Customer c = ctx.Customers.Where(x => x.CustomerUserName == name).First();
        Label1.Text = name.ToUpper();
        Label2.Text = c.Address.ToUpper();
        if (c.CreditAmount == null) { Label3.Text ="0.0"; }
        else { Label3.Text = c.CreditAmount.ToString(); }
        if (User.IsInRole("Employee"))
        { Label4.Text = "Employee"; }
        else { Label4.Text = "Member"; }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateAddress.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PassUpdate.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateEmail.aspx");

    }
}