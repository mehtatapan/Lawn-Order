// Author: Derek Truong

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name.ToString()))
                pnl_WelcomeUser.Visible = false;
            else
                lbl_UserName.Text = HttpContext.Current.User.Identity.Name.ToString();
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login");
        }
    }
}