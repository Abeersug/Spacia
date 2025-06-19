using System;
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
            if (!IsPostBack)
            {
                HandleUserInterface();
            }
        }

        private void HandleUserInterface()
        {
            
            SignInButton.Visible = false;
            ddlUserMenu.Visible = false;

            if (IsUserLoggedIn)
            {
                ddlUserMenu.Visible = true;    
                SignInButton.Visible = false;
                lnkUserProfile.Visible = true;

                string userRole = Session["UserRole"]?.ToString();

                if (userRole == "Admin")
                {
                   
                   
                }
                else if (userRole == "User")
                {
                    
                }
                else
                {
                    
                }
            }
            else
            {
                ddlUserMenu.Visible = false;   
                SignInButton.Visible = true;
                lnkUserProfile.Visible = false;
            }
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

        protected void UserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserProfile.aspx");
        }

        protected void ddlUserMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlUserMenu.SelectedValue;

            if (selectedValue == "Dashboard")
            {
                string userRole = Session["UserRole"]?.ToString();

                if (userRole == "Admin")
                {
                    Response.Redirect("~/Admin1.aspx");
                }
                else
                {
                    Response.Redirect("~/UserDashboard.aspx");
                }
            }
            else if (selectedValue == "Logout")
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("~/Default.aspx");
            }

           
            ddlUserMenu.SelectedIndex = 0;
        }
    }
}
