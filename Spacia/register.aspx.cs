using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
	public partial class register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

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
            cmd.Parameters.AddWithValue("Role","user" );

            cmd.ExecuteNonQuery();
            Label1.Text = "You Have Successfully Register";
            //Response.Redirect("AnotherPage.aspx");
            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}