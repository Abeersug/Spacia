using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
    public partial class SiteMaster : MasterPage
    {
        public bool IsUserLoggedIn
        {
            get
            {
                return Session["UserID"] != null;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.DataBind();
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
}