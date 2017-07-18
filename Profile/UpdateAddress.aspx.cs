using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Authentication;

public partial class ProfileManagement : System.Web.UI.Page
{
    Customer cust;
    GreatBooksDBEntities ctx;

    protected void Page_Load(object sender, EventArgs e)
    {

        ctx = new GreatBooksDBEntities();
        DataTable dt = new DataTable();

        cust = ctx.Customers.Where(x => x.CustomerUserName == User.Identity.Name.ToString()).First();

        CurrentAddress.Text = cust.Address;


    }

    protected void UpdateAddressButton_OnClick(object sender, EventArgs e)
    {
        string fAddress = AddressTextBox.Text.ToString() + " Singapore " + pCode.Text.ToString();
        cust.Address = fAddress;
        ctx.SaveChanges();
        Response.Redirect("~/Profile/MyProfile.aspx");
    }
}

