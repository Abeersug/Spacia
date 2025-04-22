using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Spacia.Models;

namespace Spacia
{
    public partial class SignIn : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Specia.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from Users where Email=@Email and Password=@Password", con);
            cmd.Parameters.AddWithValue("Email", TextBox1.Text);
            cmd.Parameters.AddWithValue("Password", TextBox2.Text);
            SqlCommand cmd2 = new SqlCommand("select Role from Users where Email=@Email and Password=@Password", con);
            cmd2.Parameters.AddWithValue("Email", TextBox1.Text);
            cmd2.Parameters.AddWithValue("Password", TextBox2.Text);
            int check =Convert.ToInt32 (cmd.ExecuteScalar());
            if (check > 0)
            {
                string Role = cmd2.ExecuteScalar().ToString();
                if (Role == "Admin")
                    Response.Redirect("Admin1.aspx");
                else
                    Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Text = "incorrect Email or Password";
            }



                try
                {
                    string email = TextBox1.Text.Trim();
                    string password = TextBox2.Text;

                    System.Diagnostics.Debug.WriteLine($"Login attempt for email: {email}");

                    // First check if user exists
                    var user = DatabaseHelper.GetUserByEmail(email);
                    if (user == null)
                    {
                        Label1.Visible = true;
                        Label1.Text = "No account found with this email";
                        System.Diagnostics.Debug.WriteLine("User not found in database");
                        return;
                    }

                    System.Diagnostics.Debug.WriteLine($"User found. Stored password hash: {user.Password}");

                    // Then check if password matches
                    string hashedPassword = DatabaseHelper.HashPassword(password);
                    System.Diagnostics.Debug.WriteLine($"Computed password hash: {hashedPassword}");

                    if (user.Password == hashedPassword)
                    {
                        // Update last login time
                        user.LastLoginAt = DateTime.Now;

                        // Set session variables
                        Session["UserID"] = user.UserId;
                        Session["UserName"] = $"{user.FirstName} {user.LastName}";
                        Session[user.Role.Equals("admin", StringComparison.OrdinalIgnoreCase) ? "adname" : "username"] = user.UserId;

                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "Incorrect password";
                    }
                }
                catch (Exception ex)
                {
                    Label1.Visible = true;
                    Label1.Text = $"An error occurred: {ex.Message}";
                    System.Diagnostics.Debug.WriteLine($"Login error: {ex.Message}");
                }
        }
    }
}