using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
	public partial class AddAvailability : System.Web.UI.Page
	{
          protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\loool\OneDrive - King Suad University\Desktop\web gp\Spacia\Spacia\App_Data\Specia.mdf"";Integrated Security=True");
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT ServiceID, ServiceName FROM Services", con);
                SqlDataReader dr = cmd.ExecuteReader();

                DropDownList1.DataSource = dr;
                DropDownList1.DataTextField = "ServiceName";
                DropDownList1.DataValueField = "ServiceID";
                DropDownList1.DataBind();

                con.Close();
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\loool\OneDrive - King Suad University\Desktop\web gp\Spacia\Spacia\App_Data\Specia.mdf"";Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Availability (ServiceID, AvailabilityDate, AvailabilityTime,Available) VALUES (@ServiceID, @AvailabilityDate, @AvailabilityTime,@Available)", con);
            cmd.Parameters.AddWithValue("@ServiceID", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@AvailabilityDate", TextBox2.Text);
            cmd.Parameters.AddWithValue("@AvailabilityTime", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Available",0);
            cmd.ExecuteNonQuery();
            Label1.Text = "You Have Successfully Add New Availability";
            con.Close();
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}