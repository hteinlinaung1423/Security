using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile_OrderHistory : System.Web.UI.Page
{
    GreatBooksDBEntities context;
    Customer cust;
    List<Order> order;
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new GreatBooksDBEntities();
        string summary = "";
        if (User.Identity.Name == null)
        {
            summary = "unknown user detected";
        } else
        {
            string user = User.Identity.Name;
            cust = context.Customers.Where(x => x.CustomerUserName == user.ToString()).First();
            order = context.Orders.Where(x => x.CustomerUserName == user.ToString()).ToList();
            summary = string.Format("You have a total of {0} orders", order.Count);
        }
        lbUserOrderSummary.Text = summary;
        GridView1.DataSource = order;
        GridView1.DataBind();
        
    }
    //protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName != "ViewDetails") return;
    //    string key = e.CommandArgument.ToString();
    //    Response.Redirect("OrderHistoryDetail.aspx?key=" + key);
    //}


    protected void Button5_Click(object sender, EventArgs e)
    {

        //Get the button that raised the event
        Button btn = (Button)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        
        string key = gvr.Cells[1].Text;
        Response.Redirect("OrderHistoryDetail.aspx?key="+key);
    }
}