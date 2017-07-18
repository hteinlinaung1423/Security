using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Profile_PassUpdate : System.Web.UI.Page
{
    MembershipUser u;
    public void Page_Load(object sender, EventArgs args)
    {
        u = Membership.GetUser(User.Identity.Name);


        if (!IsPostBack)
        {

        }
    }
    public void ChangePassword_OnClick(object sender, EventArgs args)
    {

        MembershipUser u = Membership.GetUser(User.Identity.Name);

        try
        {
            if (u.ChangePassword(OldPasswordTextbox.Text, PasswordTextbox.Text))
            {

                Response.Redirect("notifypasschange.aspx");
            }
            else
            {
                Msg.Text = "Password change failed";
                Msg.Visible = true;
            }

        }
        catch
        {
            Msg.Text = "An error occurred";
            Msg.Visible = true;
        }
        
    }
}