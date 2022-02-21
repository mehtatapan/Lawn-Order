// Author: Emma Casagrande-Kellam

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp.Customers
{
    public partial class Default : System.Web.UI.Page
    {
        private bool isInsertMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");
        }

        protected void dvCustomer_DataBound(object sender, EventArgs e)
        {
            // I borrowed this functionality from Derek's code for the Receipt and Content pages
            // Hide most row visibility of this control except in Insert mode.
            isInsertMode = (dvCustomer.CurrentMode == DetailsViewMode.Insert);
            dvCustomer.Rows[0].Visible = isInsertMode;
            dvCustomer.Rows[1].Visible = isInsertMode;
            dvCustomer.Rows[2].Visible = isInsertMode;
            dvCustomer.Rows[3].Visible = isInsertMode;
            dvCustomer.Rows[4].Visible = isInsertMode;
            dvCustomer.Rows[5].Visible = isInsertMode;
            dvCustomer.Rows[6].Visible = isInsertMode;
            dvCustomer.Rows[7].Visible = isInsertMode;
            dvCustomer.Rows[8].Visible = true;

            if(isInsertMode)
            {
                // Default the customer ID to the next open customer ID
                var nextCustomerID = (((DataView)odsCustomers.Select()).ToTable()).Select().FirstOrDefault()[0];
                TextBox txtNewCustomerID = (TextBox)dvCustomer.Rows[1].FindControl("txtNewCustomerID");
                txtNewCustomerID.Text = nextCustomerID.ToString();

            }
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvCustomers.SelectedIndex != -1)
                Response.Redirect("~/Customers/CustomerDetails?customer=" + gvCustomers.SelectedValue);
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            txtFirstNameFilter.Text = "";
            txtLastNameFilter.Text = "";
            txtCityNameFilter.Text = "";
        }
    }
}