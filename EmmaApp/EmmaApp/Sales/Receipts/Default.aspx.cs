// Author: Derek Truong

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class ManageReceipts : System.Web.UI.Page
    {
        private bool isInsertMode = false;
        private bool isEditMode = false;
        private string connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
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

        protected void dvReceipt_DataBound(object sender, EventArgs e)
        {
            // Hide most row visibility of this control except in Insert mode.
            isInsertMode = (dvReceipt.CurrentMode == DetailsViewMode.Insert);
            dvReceipt.Rows[0].Visible = isInsertMode;
            dvReceipt.Rows[1].Visible = isInsertMode;
            dvReceipt.Rows[2].Visible = isInsertMode;
            dvReceipt.Rows[3].Visible = isInsertMode;
            dvReceipt.Rows[4].Visible = isInsertMode;
            dvReceipt.Rows[5].Visible = isInsertMode;
            dvReceipt.Rows[6].Visible = isInsertMode;
            dvReceipt.Rows[7].Visible = true;

            // Set default values in Insert mode and disable buttons in other controls.
            if (isInsertMode)
            {
                // Default date to today's date
                TextBox txtNewDate = (TextBox)dvReceipt.Rows[2].FindControl("txtNewDate");
                txtNewDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                // Default the order number to the next open order number
                var nextOrdNumber = (((DataView)odsNextOrdNumber.Select()).ToTable()).Select().FirstOrDefault()[0];
                TextBox txtNewOrderNumber = (TextBox)dvReceipt.Rows[1].FindControl("txtNewOrderNumber");
                txtNewOrderNumber.Text = nextOrdNumber.ToString();

                // Disable buttons in other controls
                DisableButtons(gvReceipt);
            }
            else
            {
                // Enable buttons in other controls
                EnableButtons(gvReceipt);
            }
        }

        protected void gvReceipt_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Disable buttons in other controls when Edit mode.
            isEditMode = (e.CommandName == "Edit");
            if (isEditMode)
            {
                DisableButtons(dvReceipt);
            }
            else
            {
                EnableButtons(dvReceipt);
            }
        }

        protected void gvReceipt_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Disable buttons within other rows of this same control when Edit mode.
            if (isEditMode)
            {
                DisableButtons(gvReceipt);
            }
            else
            {
                EnableButtons(gvReceipt);
            }
        }
        protected void gvReceipt_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                //Delete was successful - Do Something
            }
            else
            {
                // Delete was not successful - Do something else
                e.ExceptionHandled = true;

                if (e.Exception.GetBaseException().ToString().Contains("serord_fk_reseiptID"))
                    lblError.Text = "• Unable to delete Receipt. You cannot delete a Receipt that contains order Contents.";
                else
                    lblError.Text = "• Unknown error. Unable to delete Receipt. Try again later, or contact your system administrator.";
            }
        }
        protected void odsReceipt_ObjectCreated(object sender, ObjectDataSourceEventArgs e)
        {
            if (e.ObjectInstance != null)
            {
                // Save connection string from ObjectDataSource to use for ADO
                connectionString = ((SqlConnection)e.ObjectInstance.GetType()
                    .GetProperty("Connection", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance)
                    .GetValue(e.ObjectInstance, null)
                 ).ConnectionString;
            }
        }

        protected void odsReceipt_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                // I edited the return value in this table adaptor's code inside the library to be:
                // int returnValue = System.Convert.ToInt32(this.Adapter.InsertCommand.ExecuteScalar());
                // So it returns the ID of the last Inserted record
                int lastID = Convert.ToInt32(e.ReturnValue);

                // Now I perform ADO to Update the new record's Order Number to match its ID
                SqlConnection con = new SqlConnection();
                con.ConnectionString = connectionString;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandText = $"UPDATE receipt " +
                    $"SET ordNumber = '{lastID}'" +
                    $"WHERE id = {lastID}";

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    lblError.Text = "• Unknown error. Added Receipt, but was unable to verify Order Number.";
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                        con.Close();
                }
            }
            else
            {
                // Some Exception - e.Exception.Message;
                e.ExceptionHandled = true;
                lblError.Text = "• Unknown error. Unable to add Receipt. Try again later, or contact your system administrator.";
            }
        }

        protected void gvReceipt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvReceipt.SelectedIndex != -1)
                Response.Redirect("~/Sales/Receipts/Contents?orderNo=" + gvReceipt.SelectedValue);
        }

        protected void gvReceipt_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Update was successful - Do Something
            }
            else
            {
                // Update was not successful - Do something else
                e.ExceptionHandled = true;

                lblError.Text = "• Unknown error. Unable to save Receipt. Try again later, or contact your system administrator.";
            }
        }
    }
}
