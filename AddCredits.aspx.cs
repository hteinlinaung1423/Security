using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCredits : System.Web.UI.Page
{
    string USER_TEMP = "nyan";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string credits;
            using (GreatBooksDBEntities context = new GreatBooksDBEntities())
            {
                credits = context.Customers.Where(x => x.CustomerUserName == USER_TEMP).First().CreditAmount.ToString();
            }
            Label_Credits.Text = "$" + credits;
        }
    }

    protected void Button_AddCredits_Click(object sender, EventArgs e)
    {
        int creditsToAdd = Convert.ToInt32(TextBox_CreditsToAdd.Text);
        string newCredits = "";

        using (GreatBooksDBEntities context = new GreatBooksDBEntities())
        {
            Customer cust = context.Customers.Where(x => x.CustomerUserName == USER_TEMP).First();

            cust.CreditAmount = cust.CreditAmount + creditsToAdd;

            newCredits = cust.CreditAmount.ToString();

            context.SaveChanges();
        }
        Label_Credits.Text = "$" + newCredits;
        TextBox_CreditsToAdd.Text = "";
    }
}