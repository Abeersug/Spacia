using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
    public partial class BookNow : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsUserLoggedIn())
            {
                Response.Redirect("~/SignIn.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
            }
        }

        protected bool IsUserLoggedIn()
        {
            return Session["UserID"] != null;
        }

        protected void BookPrivate_Click(object sender, EventArgs e)
        {
            // TODO: Implement booking logic for private office
            Response.Redirect("~/Packages.aspx?type=private");
        }

        protected void BookDesk_Click(object sender, EventArgs e)
        {
            // TODO: Implement booking logic for dedicated desk
            Response.Redirect("~/Packages.aspx?type=desk");
        }

        protected void BookMeeting_Click(object sender, EventArgs e)
        {
            // TODO: Implement booking logic for meeting room
            Response.Redirect("~/Packages.aspx?type=meeting");
        }

        protected void Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact.aspx");
        }
    }
}