﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SuccessfulPayment : System.Web.UI.Page
{
    Customer cust;
    GreatBooksDBEntities ctx;
    protected void Page_Load(object sender, EventArgs e)
    {
        ctx = new GreatBooksDBEntities();
        DataTable dt = new DataTable();

        cust = ctx.Customers.Where(x => x.CustomerUserName == User.Identity.Name.ToString()).First();

        CreditBalance.Text = string.Format("{0:c}", cust.CreditAmount);// "$ " + cust.CreditAmount.ToString();
    }

    protected void AcceptBalance_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx"); //This would redirect to Main Page
    }
}