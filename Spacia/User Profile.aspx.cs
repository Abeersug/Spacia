using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
	public partial class User_Profile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
			if (e.Row.RowType == DataControlRowType.DataRow)
				e.Row.Cells[2].Text = new string('*', e.Row.Cells[2].Text.Length);
        }
    }
}