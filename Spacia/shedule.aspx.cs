using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
    public partial class shedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button1_click(object sender, EventArgs e)
        {
           
            if (Session["UserID"] == null)
            {
                
                string currentUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("~/SignIn.aspx?ReturnUrl=" + HttpUtility.UrlEncode(currentUrl));
            }
            else
            {
             
                Button btn = (Button)sender;
                string id = btn.CommandArgument;
                Response.Redirect("booking.aspx?id=" + id);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
