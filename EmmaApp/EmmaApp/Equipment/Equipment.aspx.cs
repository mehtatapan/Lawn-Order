using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmaApp
{
    public partial class Manage_Equipment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dvEquipment.Rows[0].Visible = false;
            dvEquipment.Rows[1].Visible = false;
            dvEquipment.Rows[2].Visible = false;
            dvEquipment.Rows[3].Visible = false;
            dvEquipment.Rows[4].Visible = false;
            dvEquipment.Rows[5].Visible = false;
        }

        protected void gvEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            fvEquipment.PageIndex = Convert.ToInt32(gvEquipment.SelectedRow.Cells[1].Text) - 1;
        }

        protected void btn_AddNew_Click(object sender, EventArgs e)
        {
            dvEquipment.Rows[0].Visible = true;
            dvEquipment.Rows[1].Visible = true;
            dvEquipment.Rows[2].Visible = true;
            dvEquipment.Rows[3].Visible = true;
            dvEquipment.Rows[4].Visible = true;
            dvEquipment.Rows[5].Visible = true;
        }
    }
}