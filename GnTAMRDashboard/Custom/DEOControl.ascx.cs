using DevExpress.Web.ASPxGridView;
using GnTAMRDashboard.SecurityManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    public partial class DEOControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // txtCourseDate.Text = DateTime.Now.ToShortDateString();
            if (!Page.IsPostBack)
            {
               // BindTime();
            }


        }

        protected void btnTrainingSave_Click(object sender, EventArgs e)
        {

            if ((comboPlant.SelectedIndex >= 0) && (comboTrainingType.SelectedIndex >= 0))
            {
                if (((string.IsNullOrEmpty(txtCourseName.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtCourseName.Text.ToString()) == false))
                    && ((string.IsNullOrEmpty(txtTrainerName.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtTrainerName.Text.ToString()) == false))
                    && ((string.IsNullOrEmpty(txtDepartment.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtDepartment.Text.ToString()) == false))
                     && ((string.IsNullOrEmpty(txtLocation.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtLocation.Text.ToString()) == false))
                    && ((string.IsNullOrEmpty(ddlTimeFrom.SelectedItem.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(ddlTimeFrom.SelectedItem.Text.ToString()) == false))
                    && ((string.IsNullOrEmpty(ddlTimeTo.SelectedItem.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(ddlTimeTo.SelectedItem.Text.ToString()) == false))
                    && ((string.IsNullOrEmpty(txtCourseDate.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtCourseDate.Text.ToString()) == false)))
                {

                    string selPlant = comboPlant.SelectedItem.Text.ToString();
                    string selTrainingType = comboPlant.SelectedItem.ToString();


                    if (((selPlant.Equals("0", StringComparison.CurrentCultureIgnoreCase)) == false) && ((selTrainingType.Equals("0", StringComparison.CurrentCultureIgnoreCase)) == false))
                    {

                        string fhTime = ddlTimeFrom.Text.ToString().Substring(0, 2).Trim();
                        string thTime = ddlTimeTo.Text.ToString().Substring(0, 2).Trim();


                        if (Convert.ToInt32(thTime) >= Convert.ToInt32(fhTime))
                        {

                            //create training.te
                            DataTable dtm = new SecurityManager.UserManagement().SaveTraining(txtCourseName.Text.ToString(), txtTrainerName.Text.ToString(),
                                        txtDepartment.Text.ToString(), txtLocation.Text.ToString(), Convert.ToInt32(comboPlant.SelectedValue.ToString()), Convert.ToInt32(comboTrainingType.SelectedValue.ToString()),
                                        ddlTimeFrom.SelectedItem.Text.ToString(), ddlTimeTo.SelectedItem.Text.ToString(), Session["thisUserName"].ToString(), txtCourseDate.Text.ToString());

                            if (dtm.Rows.Count > 0)
                            {
                                if (dtm.Select("ErrorCode=0").Count() > 0)
                                {
                                    string msg = dtm.Select("ErrorCode=0").CopyToDataTable().Rows[0]["Remarks"].ToString().Trim();
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "')", true);

                                }

                                txtCourseName.Text = string.Empty;
                                txtTrainerName.Text = string.Empty;
                                txtDepartment.Text = string.Empty;
                                txtLocation.Text = string.Empty;



                            }

                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('invalid time input')", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('unable to create training, missing mandatory information')", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('unable to create training, missing mandatory information')", true);
            }
            

            (AttendeeControl.FindControl("comboTrainingMaster") as DropDownList).DataBind();
            (TrainingEditControl.FindControl("EditTrainingGrd") as ASPxGridView).DataBind();

        }


        protected void grdProgressChildGrdAPR_BeforePerformDataSelect(object sender, EventArgs e)
        {
            try
            {

                ASPxGridView grd;
                grd = sender as ASPxGridView;
                Session["TRAINING_MASTER_ID_APR"] = grd.GetMasterRowKeyValue();

            }
            catch (Exception)
            {


            }

        }


        //https://www.c-sharpcorner.com/UploadFile/de41d6/exceptionerror-handling-in-Asp-Net-simplified/

        protected void btnFDBModalPopUp_Click(object sender, EventArgs e)
        {

            List<object> sRow = new DAL().getSelectedValues(ApprovalTrainingGrd);
            if (sRow.Count() > 0)
            {
                if ((sRow.ElementAt(0) is Array))
                {
                    string reqTrainID = (sRow.ElementAt(0) as Array).GetValue(0).ToString();
                    if (((string.IsNullOrEmpty(reqTrainID) == false) && (string.IsNullOrWhiteSpace(reqTrainID) == false)))
                    {

                        DataTable dt = this.GetAttendeesByTrainingID(reqTrainID);
                        if (dt.Rows.Count>0)
                        {

                                        System.Security.Principal.WindowsIdentity identity = HttpContext.Current.Request.LogonUserIdentity;
                                        string userName = identity.Name.Substring(identity.Name.LastIndexOf(@"\") + 1);
                                        //userName = "shahid.majeed";

                                        if (((string.IsNullOrEmpty(userName) == false) && (string.IsNullOrWhiteSpace(userName) == false)))
                                        {
                                            //string emailAddress = (userName + "@ke.com.pk");
                                            //Dictionary<string, string> s = new SAPManager.SAPManager().GetEmployeeInfoFromSAPByEmailAddress(emailAddress);
                                            userName = Regex.Replace(userName, @"[^0-9A-Za-z,]", "");

                                            if ((from myRow in dt.AsEnumerable()
                                                 where Regex.Replace(myRow.Field<string>("EmployeeName"), @"[^0-9A-Za-z,]", "")
                                                 .Equals(Regex.Replace(userName, @"[^0-9A-Za-z,]", ""), StringComparison.CurrentCultureIgnoreCase) select myRow).Count()>0)
                                            {
                                                var EmployeeName = (from myRow in dt.AsEnumerable()
                                                                           where Regex.Replace(myRow.Field<string>("EmployeeName"), @"[^0-9A-Za-z,]", "")
                                                                           .Equals(Regex.Replace(userName, @"[^0-9A-Za-z,]", ""), StringComparison.CurrentCultureIgnoreCase)
                                                                           select myRow).ElementAt(0)["EmployeeName"].ToString();

                                                Session["thisFDBTrainingID"] = reqTrainID;
                                                string atnID = (from myRow in dt.AsEnumerable()
                                                                            where Regex.Replace(myRow.Field<string>("EmployeeName"), @"[^0-9A-Za-z,]", "")
                                                                            .Equals(Regex.Replace(userName, @"[^0-9A-Za-z,]", ""), StringComparison.CurrentCultureIgnoreCase)
                                                                            select myRow).ElementAt(0)["ATNID"].ToString();

                                                string empNO = (from myRow in dt.AsEnumerable()
                                                                           where Regex.Replace(myRow.Field<string>("EmployeeName"), @"[^0-9A-Za-z,]", "")
                                                                           .Equals(Regex.Replace(userName, @"[^0-9A-Za-z,]", ""), StringComparison.CurrentCultureIgnoreCase)
                                                                           select myRow).ElementAt(0)["EmployeeeNo"].ToString();



                                                Session["thisFDBATNID"] = atnID;
                                                Session["thisFDBEMPNO"] = empNO;
                                                Response.Redirect("FDB.aspx");

                                            }


                                        }
                            
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must have attendees to proceed')", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must provide mandatory information as required')", true);
                    }

                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select rows to proceed')", true);
            }

        }




        private DataTable GetAttendeesByTrainingID(string TrainingID)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("GetAttendeesByTrainingID", con);
                cmd.Parameters.Add(new SqlParameter("@TrainingID", Convert.ToInt32(TrainingID)));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return dt;

        }





        private void BindTime()
        {
            // Set the start time (00:00 means 12:00 AM)
            DateTime StartTime = DateTime.ParseExact("00:00", "HH:mm", null);
            // Set the end time (23:55 means 11:55 PM)
            DateTime EndTime = DateTime.ParseExact("23:55", "HH:mm", null);
            //Set 5 minutes interval
            TimeSpan Interval = new TimeSpan(0, 5, 0);
            //To set 1 hour interval
            //TimeSpan Interval = new TimeSpan(1, 0, 0);           
            ddlTimeFrom.Items.Clear();
            ddlTimeTo.Items.Clear();
            while (StartTime <= EndTime)
            {
                ddlTimeFrom.Items.Add(StartTime.ToShortTimeString());
                ddlTimeTo.Items.Add(StartTime.ToShortTimeString());
                StartTime = StartTime.Add(Interval);
            }
            ddlTimeFrom.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlTimeTo.Items.Insert(0, new ListItem("--Select--", "0"));
        }

       

   

      



    }
}