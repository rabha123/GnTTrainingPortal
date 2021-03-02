using GnTAMRDashboard.SecurityManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //int x = 0;
            //double y = (x / x);

            try
            {

                if (((string.IsNullOrEmpty(txtUserID.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtUserID.Text.ToString()) == false))
                && ((string.IsNullOrEmpty(txtPassword.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtPassword.Text.ToString()) == false)))
                {
                    if (new UserManagement().validateFromActiveDirectory(txtUserID.Text.ToString(), txtPassword.Text.ToString()))
                    {

                        DataTable dt = new UserManagement().getSelectedUserDetails(txtUserID.Text.ToString());
                        string navigationURL = dt.Rows[0]["navigationURL"].ToString();

                        Session["thisUserID"] = dt.Rows[0]["UserID"].ToString();
                        Session["thisUserName"] = dt.Rows[0]["UserName"].ToString();
                        Session["thisRoleName"] = dt.Rows[0]["RoleName"].ToString();
                        Session["thisTrainingTypeID"] = dt.Rows[0]["TrainingTypeID"].ToString();
                        Session["thisTrainingTypeName"] = dt.Rows[0]["TrainingTypeName"].ToString();
                        Session["thisisActiveUser"] = dt.Rows[0]["isActive"].ToString();
                        Session["thisNavigationURL"] = dt.Rows[0]["navigationURL"].ToString();
                        Session["thisPlantName"] = dt.Rows[0]["PlantName"].ToString();
                        Session["thisPlantID"] = dt.Rows[0]["PlantID"].ToString();
                        Session["thisRoleID"] = dt.Rows[0]["RoleID"].ToString();


                        if ((((string.IsNullOrWhiteSpace(navigationURL)) == false) && ((string.IsNullOrWhiteSpace(navigationURL)) == false)))
                        {

                            try
                            {
                                //new LDCGENTableAdapters.QueriesTableAdapter().GenerateLDCGENAuditLog(Session["thisUserName"].ToString(), navigationURL);
                                Response.Redirect(navigationURL);

                            }
                            catch (Exception)
                            {

                            }
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You donot have access to any of the application module. Please contact application administrator to further details')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You have entered an invalid username or password')", true);
                }

            }
            catch (Exception ex)
            {

            }
        }




    }
}