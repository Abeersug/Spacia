using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Spacia.Models;

namespace Spacia
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                var user = GetUserById(userId);

                if (user != null)
                {
                    // Display user initials
                    litUserInitials.Text = Session["UserInitials"]?.ToString() ?? "";
                    
                    // Display user name
                    string fullName = string.IsNullOrEmpty(user.LastName) ?
                        user.FirstName :
                        $"{user.FirstName} {user.LastName}";
                    litUserName.Text = fullName;
                    litFullName.Text = fullName;
                    
                    // Display email
                    litUserEmail.Text = user.Email;
                    litEmailAddress.Text = user.Email;
                    
                    // Display phone number
                    litPhoneNumber.Text = user.PhoneNumber;
                    
                    // Display user role with first letter capitalized
                    string role = user.Role;
                    if (!string.IsNullOrEmpty(role) && role.Length > 0)
                    {
                        role = char.ToUpper(role[0]) + role.Substring(1).ToLower();
                    }
                    litUserRole.Text = role;
                    
                    // Format dates
                    litCreatedAt.Text = user.CreatedAt.ToString("MMMM d, yyyy");
                    litLastLogin.Text = user.LastLoginAt.HasValue ?
                        user.LastLoginAt.Value.ToString("MMMM d, yyyy 'at' h:mm tt") :
                        "Never";
                }
                else
                {
                    // User not found, redirect to login
                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("~/SignIn.aspx");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error loading user data: {ex.Message}");
                // Do not show the error to the user, just redirect to login
                Response.Redirect("~/SignIn.aspx");
            }
        }

        private User GetUserById(int userId)
        {
            return DatabaseHelper.GetUserById(userId);
        }
    }
}
