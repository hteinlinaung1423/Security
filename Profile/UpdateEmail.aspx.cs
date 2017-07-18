using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class UpdateEmail : System.Web.UI.Page
{
    MembershipUser u;

    public void Page_Load(object sender, EventArgs args)
    {
        u = Membership.GetUser(User.Identity.Name);


        if (!IsPostBack)
        {
            EmailTextBox.Text = u.Email;
        }
    }

    public void UpdateEmailButton_OnClick(object sender, EventArgs args)
    {
        try
        {
            u.Email = EmailTextBox.Text;


            Membership.UpdateUser(u);

            Msg.Text = "User e-mail updated.";
        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Msg.Text = e.Message;
        }
    }
}