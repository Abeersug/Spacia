using System;
using System.Web;
using System.Web.UI;

namespace Spacia
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            
            // Disable unobtrusive validation
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            
            // Register jQuery script mapping
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", 
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/jquery-3.7.0.min.js",
                    DebugPath = "~/Scripts/jquery-3.7.0.js",
                    CdnPath = "https://code.jquery.com/jquery-3.7.0.min.js",
                    CdnDebugPath = "https://code.jquery.com/jquery-3.7.0.js"
                });
        }
    }
}