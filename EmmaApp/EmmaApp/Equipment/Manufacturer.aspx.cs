// Author: Tapan Piyush Mehta

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class Manufacturer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");

            dvManufacturer.Rows[0].Visible = false;
        }

        protected void btn_AddNew_Click(object sender, EventArgs e)
        {
            dvManufacturer.Rows[0].Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dvManufacturer.Rows[0].Visible = false;
        }
    }
}