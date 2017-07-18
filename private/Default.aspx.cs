using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class private_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        // The SignOut method invalidates the authentication cookie.
        System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        
    }
}