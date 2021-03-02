using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Views
{
    public partial class FDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["thisUserID"] != null)
            {
                if (!Page.IsPostBack)
                {
                    this.SessionManagement();

                    

                    //System.Security.Principal.WindowsIdentity identity = HttpContext.Current.Request.LogonUserIdentity;
                    //string userName = identity.Name.Substring(identity.Name.LastIndexOf(@"\") + 1);
                    //string emailAddress = (userName + "@ke.com.pk").ToUpper();
                    //Dictionary<string, string> s = new SAPManager.SAPManager().GetEmployeeInfoFromSAPByEmailAddress(emailAddress);

                   

                }

            }
            else
            {
                //Session.Abandon();
                //Response.Redirect("../../Login.aspx");
                this.SessionManagement();
            }
        }
        private void SessionManagement()
        {

            try
            {
                if (Session["thisUserID"] != null)
                {
                    //allow to login
                }
                else
                {
                    Session.Abandon();
                    Response.Redirect("../Login.aspx");
                }
            }
            catch (Exception)
            {
                Session.Abandon();
                //Response.Redirect("~/View/unAuthorize.aspx");
                Response.Redirect("../Login.aspx");
            }

        }

    }
}