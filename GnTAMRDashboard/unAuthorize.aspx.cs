using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard
{
    public partial class unAuthorize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["thisError"]!=null)
                {
                    lblUnathorizeAcess.Text = Session["thisError"].ToString();
                }
                else
                {
                    lblUnathorizeAcess.Text = "something went wrong :( ";
                }
                
            }
            catch (Exception)
            {
                lblUnathorizeAcess.Text = "something went wrong :( ";
            }


        }
    }
}