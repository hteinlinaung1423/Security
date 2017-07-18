using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MockPaymentGateway : System.Web.UI.Page
{
    Customer cust;
    GreatBooksDBEntities ctx;

    protected void Page_Load(object sender, EventArgs e)
    {
        ctx = new GreatBooksDBEntities();
        DataTable dt = new DataTable();

        cust = ctx.Customers.Where(x => x.CustomerUserName == User.Identity.Name.ToString()).First();
        
        
    }

    protected void ClearButt_Click(object sender, EventArgs e)
    {
        CreditAmount.Text = String.Empty;
        NameonCard.Text = String.Empty;
        CardNumber.Text = String.Empty;
        SecCode.Text = String.Empty;
        Month.Text = String.Empty;
        Year.Text = String.Empty;
    }

    protected void SubmitButt_Click(object sender, EventArgs e)
    {
  
           
           decimal? aCredit=Convert.ToDecimal(CreditAmount.Text);       //convert textbox input to decimal
           decimal? cCredit = Convert.ToDecimal(cust.CreditAmount);     //convert and store current CreditAmount
           cust.CreditAmount = cCredit + aCredit;                       //update credit amount
            ctx.SaveChanges();                                          //update database
            Response.Redirect("~/Profile/SuccessfulPayment.aspx");
            
    
    }
}