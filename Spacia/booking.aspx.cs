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
    public partial class booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int user_id = Convert.ToInt32(Session["UserID"]);
            }
            else
            {    
                Session["ReturnUrl"] = Request.RawUrl;
                Response.Redirect("/SignIn.aspx");
            }
        }

        public int service_id;
        public string A_date;
        public string A_time;

        protected void Button1_Click(object sender, EventArgs e)
        {
            int Availablity_id = Convert.ToInt32(Request.QueryString["id"].ToString());
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\loool\OneDrive - King Suad University\Desktop\web gp\Spacia\Spacia\App_Data\Specia.mdf"";Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM Availability WHERE AvailabilityID = @AvailabilityID", con);
            cmd.Parameters.AddWithValue("@AvailabilityID", Availablity_id);

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                service_id = Convert.ToInt32(dr["ServiceID"]);
                A_date = dr["AvailabilityDate"].ToString();
                A_time = dr["AvailabilityTime"].ToString();
            }
            dr.Close();

            SqlCommand cmd2 = new SqlCommand("INSERT INTO Appointments (UserID, ServiceID, AppointmentDate, AppointmentTime) VALUES (@UserID, @ServiceID, @AppointmentDate, @AppointmentTime)", con);
            cmd2.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd2.Parameters.AddWithValue("@ServiceID", service_id);
            cmd2.Parameters.AddWithValue("@AppointmentDate", A_date);
            cmd2.Parameters.AddWithValue("@AppointmentTime", A_time);
            cmd2.ExecuteNonQuery();

            Label1.Text = "You Have Successfully Booked Appointment";

            SqlCommand cmd3 = new SqlCommand("update Availability set Available=1 where AvailabilityID=@AvailabilityID", con);
            cmd3.Parameters.AddWithValue("AvailabilityID", Availablity_id);
            cmd3.ExecuteNonQuery();

            con.Close();
        }
    }
}

