using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CreateAddress : System.Web.UI.Page
{
    Customer cust;
    GreatBooksDBEntities ctx;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctx = new GreatBooksDBEntities();
        DataTable dt = new DataTable();
       


    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string name = Request.QueryString["key"];
    //    cust = ctx.Customers.Where(x => x.CustomerUserName == name).First();
    //    string fAddress = Address.Text.ToString() + " Singapore " + pCode.Text.ToString();
    //    cust.Address = fAddress;
    //    ctx.SaveChanges();
    //    Response.Redirect("Default.aspx");
    //}

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string name = Request.QueryString["key"];
        cust = ctx.Customers.Where(x => x.CustomerUserName == name).First();
        string fAddress = Address.Text.ToString() + " Singapore " + pCode.Text.ToString();
        
        cust.Address = fAddress;
        ctx.SaveChanges();
        Response.Redirect("notifysuccess.aspx?");
    }
}