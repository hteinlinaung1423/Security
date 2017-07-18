using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IIdentity id = User.Identity;
        if (id.IsAuthenticated)
        {
            Response.Redirect("~/Default.aspx");
        }

        
      

    }

    protected void Password_TextChanged(object sender, EventArgs e)
    {
        
    }
}