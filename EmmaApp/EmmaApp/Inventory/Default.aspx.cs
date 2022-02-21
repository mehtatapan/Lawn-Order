// Author: Samuel Luke Obray

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class Inventory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");
        }

        protected void dvNew_DataBound(object sender, EventArgs e)
        {
            // Hide most row visibility of this control except in Insert mode.
            bool isInsertMode = (dvNew.CurrentMode == DetailsViewMode.Insert);
            dvNew.Rows[0].Visible = isInsertMode;
            dvNew.Rows[1].Visible = isInsertMode;
            dvNew.Rows[2].Visible = isInsertMode;
            dvNew.Rows[3].Visible = isInsertMode;
        }

        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvProduct.SelectedRow.Cells[1].Text;
            string name = gvProduct.SelectedRow.Cells[2].Text;
            Session["ID"] = id;
            Session["Name"] = name;
            Response.Redirect("~/Inventory/Details?Name=" + name);
        }

        protected void dvNew_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Insert was successful - Do Something
                Response.Redirect(Request.RawUrl);    // For some reason, this DetailsView doesn't postback, so reload page
            }
            else
            {
                // Insert was not successful - Do something else
                e.ExceptionHandled = true;

                lblError.Text = "• Unknown error. Unable to add Product. Try again later, or contact your system administrator.";
            }
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            txtBrandFilter.Text = "";
            txtItemFilter.Text = "";
        }
    }
}