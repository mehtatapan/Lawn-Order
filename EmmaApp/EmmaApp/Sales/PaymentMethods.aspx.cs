// Author: Derek Truong

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class PaymentMethods : Page
    {
        private bool isInsertMode = false;
        private bool isEditMode = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");

            lblError.Text = "";// Empty error text
        }

        // Disable all child Buttons of a UI control with the property "Enabled"
        // https://stackoverflow.com/a/15905785
        private void DisableButtons(System.Web.UI.Control control)
        {
            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                PropertyInfo prop = type.GetProperty("Enabled");

                // Set it to False to disable the button. (Except for Update and Cancel buttons)
                if (prop != null && type.ToString().Contains("Button") && ((Button)c).CommandName != "Update" && ((Button)c).CommandName != "Cancel")
                {
                    prop.SetValue(c, false, null);
                }

                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    this.DisableButtons(c);
                }
            }
        }

        // Enable all child Buttons of a UI control with the property "Enabled"
        // https://stackoverflow.com/a/15905785
        private void EnableButtons(System.Web.UI.Control control)
        {
            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                PropertyInfo prop = type.GetProperty("Enabled");

                // Set it to True to enable the button.
                if (prop != null && type.ToString().Contains("Button"))
                {
                    prop.SetValue(c, true, null);
                }

                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    this.EnableButtons(c);
                }
            }
        }

        protected void dvPayMethods_DataBound(object sender, EventArgs e)
        {
            // Hide most row visibility of this control except in Insert mode.
            isInsertMode = (dvPayMethods.CurrentMode == DetailsViewMode.Insert);
            dvPayMethods.Rows[0].Visible = isInsertMode;
            dvPayMethods.Rows[1].Visible = isInsertMode;
            dvPayMethods.Rows[2].Visible =  true;

            // Disable buttons in other controls when Insert mode.
            if (isInsertMode)
            {
                // Disable buttons in other controls
                DisableButtons(gvPayMethods);
            }
            else
            {
                // Enable buttons in other controls
                EnableButtons(gvPayMethods);
            }
        }

        protected void gvPayMethods_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Disable buttons in other controls when Edit mode.
            isEditMode = (e.CommandName == "Edit");
            if (isEditMode)
            {
                DisableButtons(dvPayMethods);
            }
            else
            {
                EnableButtons(dvPayMethods);
            }
        }

        protected void gvPayMethods_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Disable buttons within other rows of this same control when Edit mode.
            if (isEditMode)
            {
                DisableButtons(gvPayMethods);
            }
            else
            {
                EnableButtons(gvPayMethods);
            }
        }

        protected void dvPayMethods_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
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

                lblError.Text = "• Unknown error. Unable to add Payment Method. Try again later, or contact your system administrator.";
            }
        }

        protected void gvPayMethods_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                //Delete was successful - Do Something
            }
            else
            {
                // Delete was not successful - Do something else
                e.ExceptionHandled = true;
                
                if (e.Exception.GetBaseException().ToString().Contains("receipt_fk_paymentID"))
                    lblError.Text = "• Unable to delete Payment Method. You cannot delete a Payment Method that is used on a Receipt.";
                else
                    lblError.Text = "• Unknown error. Unable to delete Payment Method. Try again later, or contact your system administrator.";
            }
        }

        protected void gvPayMethods_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Update was successful - Do Something
            }
            else
            {
                // Update was not successful - Do something else
                e.ExceptionHandled = true;

                lblError.Text = "• Unknown error. Unable to save Payment Method. Try again later, or contact your system administrator.";
            }
        }
    }
}