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
    public partial class ReceiptContents : Page
    {
        private bool isInsertMode = false;
        private bool isEditMode = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");

            // Get Receipt ID from URL
            Uri uri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            string selectedID = HttpUtility.ParseQueryString(uri.Query).Get("orderNo");
            int receiptID = -1;

            try
            {
                receiptID = Convert.ToInt32(selectedID);
            }
            catch { }

            // We failed to get the ID, go back the list of Receipts
            if (receiptID <= 0)
            {
                Response.Redirect("~/Sales/Receipts");
            }

            // Add the ID number to the header text
            lblTopHeader.Text = "Order #" + receiptID.ToString();

            // Load it in Session
            Session["receiptID"] = receiptID;

            // Empty error text
            lblOrderError.Text = "";
            lblOrderLineError.Text = "";
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

        protected void dvOrderLine_DataBound(object sender, EventArgs e)
        {
            // Hide most row visibility of this control except in Insert mode.
            isInsertMode = (dvOrderLine.CurrentMode == DetailsViewMode.Insert);
            dvOrderLine.Rows[0].Visible = isInsertMode;
            dvOrderLine.Rows[1].Visible = isInsertMode;
            dvOrderLine.Rows[2].Visible = isInsertMode;
            dvOrderLine.Rows[3].Visible = isInsertMode;
            dvOrderLine.Rows[4].Visible = isInsertMode;
            dvOrderLine.Rows[5].Visible = isInsertMode;
            dvOrderLine.Rows[6].Visible = isInsertMode;
            dvOrderLine.Rows[7].Visible = isInsertMode;
            dvOrderLine.Rows[8].Visible = isInsertMode;
            dvOrderLine.Rows[9].Visible = true;

            // Set default values in Insert mode and disable buttons in other controls.
            if (isInsertMode)
            {
                // Default the receipt number to the ID in the Session
                TextBox txtNewReceiptID = (TextBox)dvOrderLine.Rows[6].FindControl("txtNewReceiptID");
                txtNewReceiptID.Text = Session["receiptID"].ToString();

                // Disable buttons in other controls
                DisableButtons(dvSingleReceipt);
                DisableButtons(gvOrderLine);
            }
            else
            {
                // Enable buttons in other controls
                EnableButtons(dvSingleReceipt);
                EnableButtons(gvOrderLine);
            }
        }

        protected void dvSingleReceipt_DataBound(object sender, EventArgs e)
        {
            // Disable buttons in other controls when Edit mode.
            isEditMode = (dvSingleReceipt.CurrentMode == DetailsViewMode.Edit);
            if (isEditMode)
            {
                // Disable buttons in other controls
                DisableButtons(dvOrderLine);
                DisableButtons(gvOrderLine);
            }
            else
            {
                // Enable buttons in other controls
                EnableButtons(dvOrderLine);
                EnableButtons(gvOrderLine);
            }

            // Hide "Add Contents" button if no receipt was loaded.
            // I could redirect user back to previous page, but I won't so I can warn them in case someone possibly deleted this record.
            // This DetailsView is will show the warning as the Data Empty message, so it will have 1 row when Empty
            if (dvSingleReceipt.Rows.Count <= 1)
                dvOrderLine.Visible = false;
        }

        protected void gvOrderLine_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Disable buttons in other controls when Edit mode.
            isEditMode = (e.CommandName == "Edit");
            if (isEditMode)
            {
                DisableButtons(dvSingleReceipt);
                DisableButtons(dvOrderLine);
            }
            else
            {
                EnableButtons(dvSingleReceipt);
                EnableButtons(dvOrderLine);
            }
        }

        protected void gvOrderLine_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Disable buttons within other rows of this same control when Edit mode.
            if (isEditMode)
            {
                DisableButtons(gvOrderLine);
            }
            else
            {
                EnableButtons(gvOrderLine);
            }
        }

        protected void ddlInvItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the value of the DDL that changed
            DropDownList senderDDL = (System.Web.UI.WebControls.DropDownList)sender;

            // Get row of the DLL that changed
            GridViewRow parentRow = (System.Web.UI.WebControls.GridViewRow)senderDDL.Parent.Parent;

            // Make sure corresponding informational DDLs are set to the same value
            SetInventoryDDLValuesInThisRow(parentRow, senderDDL.SelectedValue);
        }

        private void SetInventoryDDLValuesInThisRow(System.Web.UI.Control control, string selectedValue)
        {
            // Recurse to set dropdownlists inside this control to values that are informative to the user
            Control ddlQOHSearch = control.FindControl("ddlQOH");

            if (ddlQOHSearch != null)
            {
                DropDownList ddlQOHFound = (DropDownList)ddlQOHSearch;
                ddlQOHFound.SelectedValue = selectedValue;
            }

            Control ddlInvPriceSearch = control.FindControl("ddlInvPrice");

            if (ddlInvPriceSearch != null)
            {
                DropDownList ddlInvPriceFound = (DropDownList)ddlInvPriceSearch;
                ddlInvPriceFound.SelectedValue = selectedValue;
            }

            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    SetInventoryDDLValuesInThisRow(c, selectedValue);
                }
            }
        }

        protected void ddlNewInvItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the value of the DDL that changed
            DropDownList senderDDL = (System.Web.UI.WebControls.DropDownList)sender;

            // Make sure corresponding informational DDLs are set to the same value
            SetInventoryDDLValuesInThisDetailsView(dvOrderLine, senderDDL.SelectedValue);
        }

        private void SetInventoryDDLValuesInThisDetailsView(System.Web.UI.Control control, string selectedValue)
        {
            // Recurse to set dropdownlists inside this control to values that are informative to the user
            Control ddlQOHSearch = control.FindControl("ddlNewQOH");

            if (ddlQOHSearch != null)
            {
                DropDownList ddlQOHFound = (DropDownList)ddlQOHSearch;
                ddlQOHFound.SelectedValue = selectedValue;
            }

            Control ddlInvPriceSearch = control.FindControl("ddlNewInvPrice");

            if (ddlInvPriceSearch != null)
            {
                DropDownList ddlInvPriceFound = (DropDownList)ddlInvPriceSearch;
                ddlInvPriceFound.SelectedValue = selectedValue;
            }

            foreach (System.Web.UI.Control c in control.Controls)
            {
                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    SetInventoryDDLValuesInThisDetailsView(c, selectedValue);
                }
            }
        }

        protected void dvOrderLine_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
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

                lblOrderLineError.Text = "• Unknown error. Unable to add Order Contents. Try again later, or contact your system administrator.";
            }
        }

        protected void dvSingleReceipt_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Update was successful - Do Something
            }
            else
            {
                // Update was not successful - Do something else
                e.ExceptionHandled = true;

                lblOrderError.Text = "• Unknown error. Unable to save Receipt. Try again later, or contact your system administrator.";
            }
        }

        protected void gvOrderLine_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Delete was successful - Do Something
                Response.Redirect(Request.RawUrl);    // For some reason, this GridView doesn't postback, so reload page
            }
            else
            {
                // Delete was not successful - Do something else
                e.ExceptionHandled = true;

                lblOrderLineError.Text = "• Unknown error. Unable to delete Order Contents. Try again later, or contact your system administrator.";
            }
        }

        protected void gvOrderLine_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Update was successful - Do Something
            }
            else
            {
                // Update was not successful - Do something else
                e.ExceptionHandled = true;

                lblOrderLineError.Text = "• Unknown error. Unable to save Order Contents. Try again later, or contact your system administrator.";
            }
        }
    }
}
