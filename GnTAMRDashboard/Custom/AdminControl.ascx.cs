using GnTAMRDashboard.SecurityManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    public partial class AdminControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

  

        }


        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
             if (((string.IsNullOrEmpty(txtUserName.Text.ToString())==false ) && (string.IsNullOrWhiteSpace(txtUserName.Text.ToString()))==false))
             {
                  if ((Regex.IsMatch(txtUserName.Text.ToString(), @"^[a-zA-Z.]+$", RegexOptions.IgnoreCase)) || (Regex.IsMatch(txtUserName.Text.ToString(), @"^[a-zA-Z\\s]+$", RegexOptions.IgnoreCase)))
                  {
                      if (((comboPlant.SelectedIndex > 0) && (comboRole.SelectedIndex > 0) && (comboTrainingType.SelectedIndex > 0)))
                      {


                          DataTable dtm = new SecurityManager.UserManagement().CreateUser(txtUserName.Text.ToString(), Convert.ToInt32(comboRole.SelectedItem.Value.ToString()),
                             Convert.ToInt32(comboPlant.SelectedItem.Value.ToString()), Convert.ToInt32(comboTrainingType.SelectedItem.Value.ToString()), Session["thisUserName"].ToString());
                          if (dtm.Rows.Count > 0)
                          {
                              if (dtm.Select("ErrorCode=1").Count() > 0)
                              {
                                  string msg = dtm.Select("ErrorCode=1").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                  UserManagementGrd.DataBind();
                              }
                              else if (dtm.Select("ErrorCode=0").Count() > 0)
                              {
                                  string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                                  UserManagementGrd.DataBind();
                              }

                          }
                      }
                      else
                      {
                          ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                      }
                  }
                 else
                  {
                      ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must be valid user')", true);
                  }

             }
            else
             {
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
             }

        }



        protected void UserManagementGrd_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {
                return;
            }
            else
            {
                if (e.GetValue("Status").ToString().Equals("In Active", StringComparison.CurrentCultureIgnoreCase))
                {
                    try
                    {
                        e.Row.BackColor = System.Drawing.Color.LightPink;
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {

                }

            }
        }


        protected void btnActivate_Click(object sender, EventArgs e)
        {
            List<object> sRow = new DAL().getSelectedValues(UserManagementGrd);
            if (sRow.Count() > 0)
            {
                if ((sRow.ElementAt(0) is Array))
                {
                    string reqUserID = (sRow.ElementAt(0) as Array).GetValue(3).ToString();
                    if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(3).ToString())))
                    {
                        int r = new UserManagement().ActivateDeactivateUser(Convert.ToInt32(reqUserID.ToString()), 1);
                        if (r > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Activated')", true);
                            UserManagementGrd.DataBind();
                        

                        }

                    }

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }

        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            List<object> sRow = new DAL().getSelectedValues(UserManagementGrd);
            if (sRow.Count() > 0)
            {
                if ((sRow.ElementAt(0) is Array))
                {
                    string reqUserID = (sRow.ElementAt(0) as Array).GetValue(3).ToString();
                    if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(3).ToString())))
                    {
                        int r = new UserManagement().ActivateDeactivateUser(Convert.ToInt32(reqUserID.ToString()), 0);
                        if (r > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('In Activated')", true);
                            UserManagementGrd.DataBind();
                       


                        }

                    }

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }


        }



        protected void btnConfigure_Click(object sender, EventArgs e)
        {

            System.Security.Principal.WindowsIdentity identity = HttpContext.Current.Request.LogonUserIdentity;
            string userName = identity.Name.Substring(identity.Name.LastIndexOf(@"\") + 1);
            string emailAddress = (userName + "@ke.com.pk").ToUpper();
            Dictionary<string, string> s = new SAPManager.SAPManager().GetEmployeeInfoFromSAPByEmailAddress(emailAddress);


            List<object> sRow = new DAL().getSelectedValues(UserManagementGrd);
            if (sRow.Count() > 0)
            {
                if ((sRow.ElementAt(0) is Array))
                {
                    string reqUserID = (sRow.ElementAt(0) as Array).GetValue(4).ToString();
                    if (((string.IsNullOrEmpty(reqUserID) == false) && (string.IsNullOrWhiteSpace(reqUserID) == false)))
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('In Activated')", true);
                        //UserManagementGrd.DataBind();
                        Session["thisRequestID"] = reqUserID;
                        DataTable dt = new UserManagement().getSelectedUserDetails(reqUserID);
                        if (dt.Rows.Count > 0)
                        {
                            modalEditingPanel.ShowOnPageLoad = true;
                            modalEditingPanel.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
                            modalEditingPanel.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;


                            //popComboRole.DataBind();
                            //popComboPlant.DataBind();
                            //popComboTrainingType.DataBind();




                            //string reqUserID = (sRow.ElementAt(0) as Array).GetValue(2).ToString();
                            //need to tart work from here ...04082020....>>>>UserID
                            popUserID.Text = dt.Rows[0]["UserID"].ToString();
                            popUserName.Text = reqUserID.ToString();
                            popComboRole.SelectedValue = dt.Rows[0]["RoleID"].ToString();
                            //popComboPlant.SelectedValue = dt.Rows[0]["PlantID"].ToString();
                            //popComboTrainingType.SelectedValue = dt.Rows[0]["TrainingTypeID"].ToString();


                            popComboRole.DataBind();
                            popComboPlant.DataBind();
                            popComboTrainingType.DataBind();




                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must contais rows to proceed')", true);
                        }
                    }

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
            }

        }



       

        protected void popBtnSave_Click(object sender, EventArgs e)
        {
            string userID = popUserID.Text.ToString().Trim();
            string userName = popUserName.Text.ToString().Trim();
            string selRoleID =  popComboRole.SelectedItem.Value.ToString();
            string selPlantID = popComboPlant.SelectedItem.Value.ToString();
            string selTrainTypeID = popComboTrainingType.SelectedItem.Value.ToString();

            if (((popComboPlant.SelectedIndex > 0) && (popComboRole.SelectedIndex > 0) && (popComboTrainingType.SelectedIndex > 0)))
            {
               DataTable dtm = new UserManagement().EditUserConfiguration(userID, userName, Convert.ToInt32(selRoleID), Convert.ToInt32(selPlantID), Convert.ToInt32(selTrainTypeID), Session["thisUserName"].ToString());
               if (dtm.Rows.Count > 0)
               {
                   if (dtm.Select("ErrorCode=1").Count() > 0)
                   {
                       string msg = dtm.Select("ErrorCode=1").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                       ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                       UserManagementGrd.DataBind();
                   }
                   else if (dtm.Select("ErrorCode=0").Count() > 0)
                   {
                       string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                       ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);
                       UserManagementGrd.DataBind();

                       modalEditingPanel.ShowOnPageLoad = false;

                   }

               }

            }

        }



        //protected void btnChangeUserConfiguration_Click(object sender, EventArgs e)
        //{
        //    List<object> sRow = new DAL().getSelectedValues(EditUserConfigurationGrd);
        //    if (sRow.Count() > 0)
        //    {
        //        if ((sRow.ElementAt(0) is Array))
        //        {
        //            string reqUserID = (sRow.ElementAt(0) as Array).GetValue(2).ToString();
        //            if (((string.IsNullOrEmpty(reqUserID) == false) && (string.IsNullOrWhiteSpace(reqUserID) == false)))
        //            {
        //                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('In Activated')", true);
        //                //UserManagementGrd.DataBind();
        //                Session["thisRequestID"] = reqUserID;
        //                DataTable dt = new UserManagement().getSelectedUserDetails(reqUserID);
        //                if (dt.Rows.Count > 0)
        //                {
        //                    modalEditingPanel.ShowOnPageLoad = true;
        //                    modalEditingPanel.PopupHorizontalAlign = DevExpress.Web.ASPxClasses.PopupHorizontalAlign.WindowCenter;
        //                    modalEditingPanel.PopupVerticalAlign = DevExpress.Web.ASPxClasses.PopupVerticalAlign.WindowCenter;


        //                    //need to tart work from here ...04082020....>>>>UserID
        //                    popUserID.Text = dt.Rows[0]["UserID"].ToString();
        //                    popUserName.Text = reqUserID.ToString();
        //                    popComboRole.SelectedValue = dt.Rows[0]["RoleID"].ToString();
        //                    popComboPlant.SelectedValue = dt.Rows[0]["PlantID"].ToString();
        //                    popComboTrainingType.SelectedValue = dt.Rows[0]["TrainingTypeID"].ToString();


        //                    popComboRole.DataBind();
        //                    popComboPlant.DataBind();
        //                    popComboTrainingType.DataBind();




        //                }
        //                else
        //                {
        //                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must contais rows to proceed')", true);
        //                }
        //            }

        //        }

        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
        //    }


        //}
     

    }
}