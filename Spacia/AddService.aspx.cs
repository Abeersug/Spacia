using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
	public partial class ManageService : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\loool\OneDrive - King Suad University\Desktop\web gp\Spacia\Spacia\App_Data\Specia.mdf"";Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Services(ServiceName,Description,Duration,ServicePhoto,Price)values(@ServiceName,@Description,@Duration,@ServicePhoto,@Price)", con);
            cmd.Parameters.AddWithValue("ServiceName", TextBox5.Text);
            cmd.Parameters.AddWithValue("Description", TextBox8.Text);
            cmd.Parameters.AddWithValue("Duration", TextBox6.Text);
            cmd.Parameters.AddWithValue("ServicePhoto", "../ServiceImage/" + FileUpload1.FileName);
            cmd.Parameters.AddWithValue("Price",TextBox7.Text);
            cmd.ExecuteNonQuery();
            Label1.Text = "You Have Successfully Add New Service";
            
                if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string path = Server.MapPath("~/ServiceImage/" + fileName);
                FileUpload1.SaveAs(path);

            }


            con.Close();
            TextBox5.Text = "";
            TextBox8.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
}