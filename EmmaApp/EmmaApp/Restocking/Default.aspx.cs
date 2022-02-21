// Author: Tarunbeer Singh

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");

            //Making On-Order detail View invisible
            Hide_dvOnOrder();

            //making Product-Order detail view invisible
            Hide_dvProdOrder();

        }



        protected void gvOnOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

            Hide_dvOnOrder();


            Hide_dvProdOrder();
            dvProdOrder.Rows[4].Visible = true;

            lblProduct.Text = "Product Order Details:";
        }

        protected void Hide_dvOnOrder()
        {
            dvOnOrder.Rows[0].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[1].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[2].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[3].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[4].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[5].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[6].Visible = (dvOnOrder.CurrentMode == DetailsViewMode.Insert);
            dvOnOrder.Rows[7].Visible = true;
        }

        protected void Hide_dvProdOrder()
        {
            dvProdOrder.Rows[0].Visible = (dvProdOrder.CurrentMode == DetailsViewMode.Insert);
            dvProdOrder.Rows[1].Visible = (dvProdOrder.CurrentMode == DetailsViewMode.Insert);
            dvProdOrder.Rows[2].Visible = (dvProdOrder.CurrentMode == DetailsViewMode.Insert);
            dvProdOrder.Rows[3].Visible = (dvProdOrder.CurrentMode == DetailsViewMode.Insert);
            dvProdOrder.Rows[4].Visible = (dvProdOrder.CurrentMode == DetailsViewMode.Insert);
        }
    }
}