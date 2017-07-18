using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class adduser : System.Web.UI.Page
{
    GreatBooksDBEntities ctx;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctx = new GreatBooksDBEntities();
        DataTable dt = new DataTable();
        IIdentity id = User.Identity;
        if (id.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }
    }



    protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
    {

        string UN = CreateUserWizard1.UserName.ToString();
        Customer newcust = new Customer();
        newcust.CustomerUserName = UN;
        newcust.FirstName = "";
        newcust.LastName = "";
        newcust.Address = "";
        ctx.Customers.Add(newcust);
        ctx.SaveChanges();
        Response.Redirect("CreateAddress.aspx?key="+UN);
        
        

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string UN = CreateUserWizard1.UserName.ToString();
        Roles.AddUserToRole(UN, "Member");
        Customer newcust = new Customer();
        newcust.CustomerUserName = UN;
        newcust.FirstName = "";
        newcust.LastName = "";
        newcust.Address = "";
        ctx.Customers.Add(newcust);
        ctx.SaveChanges();
        Response.Redirect("CreateAddress.aspx?key=" + UN);
    }
}