using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Author Jessica Terryberry
namespace EmmaApp.Employee
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvManageEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCreateNew_Click(object sender, EventArgs e)
        {
            dvCreateEmployee.Visible = !dvCreateEmployee.Visible;
        }
    }
}