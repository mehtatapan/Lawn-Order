﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Author Jessica Terryberry
namespace EmmaApp
{
    public partial class EmployeeIndex : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)// Kick user to Login page if not logged in
                Response.Redirect("~/Login");
        }
    }
}