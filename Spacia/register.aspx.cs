using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Spacia.Models;

namespace Spacia
{
	public partial class register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		    
		    if (Session["UserID"] != null)
		    {
		        Response.Redirect("~/Default.aspx");
		    }
		}

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void TextBox2_TextChanged1(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Specia.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Users values(@Name,@Email,@Password,@Phone,@Role)", con);
            cmd.Parameters.AddWithValue("Name", TextBox1.Text);
            cmd.Parameters.AddWithValue("Email", TextBox2.Text);
            cmd.Parameters.AddWithValue("Password", TextBox3.Text);
            cmd.Parameters.AddWithValue("Phone", TextBox5.Text);
            cmd.Parameters.AddWithValue("Role", "user");

            cmd.ExecuteNonQuery();
            Label1.Text = "You Have Successfully Register";
            Response.Redirect("~/Default.aspx");
            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
            try
            {
                
                var existingUser = DatabaseHelper.GetUserByEmail(TextBox2.Text.Trim());
                if (existingUser != null)
                {
                    Label1.Visible = true;
                    Label1.Text = "This email is already registered. Please use a different email or sign in.";
                    return;
                }

                
                User newUser = new User
                {
                    FirstName = TextBox1.Text.Trim(),
                    LastName = "", 
                    Email = TextBox2.Text.Trim(),
                    Password = TextBox3.Text, 
                    PhoneNumber = TextBox5.Text.Trim(),
                    Role = "user",
                    CreatedAt = DateTime.Now
                };

                
                bool success = DatabaseHelper.RegisterUser(newUser);

                if (success)
                {
                    
                    var user = DatabaseHelper.GetUserByEmail(newUser.Email);
                    if (user != null)
                    {
                        
                        Session["UserID"] = user.UserId;
                        Session["UserEmail"] = user.Email;
                        Session["UserName"] = string.IsNullOrEmpty(user.LastName) ? 
                                         user.FirstName : 
                                         $"{user.FirstName} {user.LastName}";
                        Session["UserFirstName"] = user.FirstName;
                        Session["UserRole"] = user.Role;
                        Session["UserInitials"] = GetUserInitials(user.FirstName, user.LastName);
                        
                        
                        DatabaseHelper.UpdateUserLastLogin(user.UserId);
                        
                       
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                       
                        Label1.Visible = true;
                        Label1.CssClass = "success-message";
                        Label1.Text = "Registration successful! Please sign in.";
                        
                        
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        TextBox4.Text = "";
                        TextBox5.Text = "";
                        
                        
                        Response.Redirect("~/SignIn.aspx");
                    }
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "An error occurred during registration. Please try again.";
                }
            }
            catch (Exception ex)
            {
                Label1.Visible = true;
                Label1.Text = $"An error occurred: {ex.Message}";
                System.Diagnostics.Debug.WriteLine($"Registration error: {ex.Message}");
            }
        }

        private string GetUserInitials(string firstName, string lastName)
        {
            string initials = "";
            
            if (!string.IsNullOrEmpty(firstName) && firstName.Length > 0)
            {
                initials += firstName[0];
            }
            
            if (!string.IsNullOrEmpty(lastName) && lastName.Length > 0)
            {
                initials += lastName[0];
            }
            
            return initials.ToUpper();
        }
    }
}