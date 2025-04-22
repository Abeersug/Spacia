using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spacia
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                // TODO: Implement actual email sending logic here
                // For now, just show a success message
                lblStatus.Text = "Thank you for your message. We'll get back to you soon!";
                lblStatus.CssClass = "text-success text-center mt-2";
                lblStatus.Visible = true;

                // Clear the form
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }
            catch (Exception)
            {
                lblStatus.Text = "Sorry, there was an error sending your message. Please try again later.";
                lblStatus.CssClass = "validation-error";
                lblStatus.Visible = true;
            }
        }
    }
}