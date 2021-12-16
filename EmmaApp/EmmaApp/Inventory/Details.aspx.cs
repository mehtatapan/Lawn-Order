using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class Details : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (gvDetails.Rows.Count > 0)
            {
                dvNew.Visible = false;
            }
            else
            {

            }
        }

        protected void dvNew_DataBound(object sender, EventArgs e)
        {
            bool isInsertMode = (dvNew.CurrentMode == DetailsViewMode.Insert);
            dvNew.Rows[0].Visible = isInsertMode;
            dvNew.Rows[1].Visible = isInsertMode;
            dvNew.Rows[2].Visible = isInsertMode;
            dvNew.Rows[3].Visible = isInsertMode;
            dvNew.Rows[4].Visible = isInsertMode;
            dvNew.Rows[5].Visible = isInsertMode;

            if (isInsertMode == true)
            {
                // Default the product ID to the ID in the Session
                TextBox txtProductID = (TextBox)dvNew.Rows[5].FindControl("txtProductID");
                txtProductID.Text = Session["ID"].ToString();
            }
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

        protected void gvDetails_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Delete was successful - Do Something
                Response.Redirect(Request.RawUrl);    // For some reason, this DetailsView doesn't postback, so reload page
            }
            else
            {
                // Delete was not successful - Do something else
                e.ExceptionHandled = true;

                lblError.Text = "• Unknown error. Unable to delete Product. Try again later, or contact your system administrator.";
            }
        }

        protected void dvName_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Delete was successful - Do Something
                Response.Redirect("~/Inventory");
            }
            else
            {
                // Delete was not successful - Do something else
                e.ExceptionHandled = true;

                if (e.Exception.GetBaseException().ToString().Contains("inventory_fk_productID"))
                    lblError.Text = "• Unable to delete Product. You cannot delete a Product that has Inventory information.";
                else
                    lblError.Text = "• Unknown error. Unable to delete Product. Try again later, or contact your system administrator.";
            }
        }
    }
}
