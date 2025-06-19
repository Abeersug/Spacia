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

            if (Session["UserID"] != null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\loool\OneDrive - King Suad University\Desktop\web gp\Spacia\Spacia\App_Data\Specia.mdf"";Integrated Security=True");

            SqlDataAdapter sda = new SqlDataAdapter("SELECT UserID, Name, Role FROM [Users] WHERE Email = @Email AND Password = @Password", con);
            sda.SelectCommand.Parameters.AddWithValue("@Email", TextBox1.Text);
            sda.SelectCommand.Parameters.AddWithValue("@Password", TextBox2.Text);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                Session["UserName"] = dt.Rows[0]["Name"].ToString();
                Session["UserInitials"] = dt.Rows[0]["Name"].ToString().Substring(0, 1).ToUpper();
                Session["UserRole"] = dt.Rows[0]["Role"].ToString();

                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    if (Session["UserRole"].ToString() == "Admin")
                    {
                        Response.Redirect("Admin1.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Invalid Email/Password";
            }
        }
    }
}

