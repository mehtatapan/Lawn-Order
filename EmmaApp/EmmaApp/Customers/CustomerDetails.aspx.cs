// Author: Emma Casagrande-Kellam

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp.Customers
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get customer ID from URL
            Uri uri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            string selectedID = HttpUtility.ParseQueryString(uri.Query).Get("customer");
            int receiptID = -1;

            try
            {
                receiptID = Convert.ToInt32(selectedID);
            }
            catch { }

            // We failed to get the ID, go back the list of Customers
            if (receiptID <= 0)
            {
                Response.Redirect("~/Customers");
            }

            // Load it in Session
            Session["customerID"] = receiptID;
        }
    }
}