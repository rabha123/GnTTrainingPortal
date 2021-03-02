using GnTAMRDashboard.SecurityManager;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    //https://www.c-sharpcorner.com/UploadFile/009464/use-dropdownlist-in-gridview-in-Asp-Net-using-C-Sharp/

    public partial class FDBControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFDBTrainingID.Text = Session["thisFDBTrainingID"].ToString();
            txtAtnID.Text = Session["thisFDBATNID"].ToString();
            txtEmpNo.Text = Session["thisFDBEMPNO"].ToString();

            DataTable dx = this.GetAttendeesByTrainingID(Session["thisFDBTrainingID"].ToString());
            if (dx.Rows.Count>0)
            {
                if ((from myRow in dx.AsEnumerable()
                     where myRow.Field<int>("ATNID").ToString().Equals(Session["thisFDBATNID"].ToString(), StringComparison.CurrentCultureIgnoreCase) select myRow).Count()>0)
                {

                    string atnID = (from myRow in dx.AsEnumerable()
                                    where myRow.Field<int>("ATNID").ToString().Equals(Session["thisFDBATNID"].ToString(), StringComparison.CurrentCultureIgnoreCase)
                                    select myRow).ElementAt(0)["ATNID"].ToString();

                    DataTable d = this.GetFeedBackTemplate(Session["thisFDBTrainingID"].ToString(), Session["thisFDBATNID"].ToString(), Session["thisFDBEMPNO"].ToString());
                    if (d.Rows.Count > 0)
                    {
                        InitTemplate.Visible = false;
                        EditTemplate.Visible = true;
                        //btnFeedBackSave.Visible = false;
                        Session["ISEdit_TFRULink"] = "2";

                    }
                    else
                    {
                        InitTemplate.Visible = true;
                        EditTemplate.Visible = false;
                        Session["ISEdit_TFRULink"] = "1";
                        // FIDPanel.Visible = true;
                    }


                }


     

            }
            else
            {
                InitTemplate.Visible = false;
                EditTemplate.Visible = false;
                btnFeedBackSave.Visible = false;

            }


            

        }


        private DataTable GetFeedBackTemplate(string TrainingID, string AtnID, string EmpNo)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("GetFeedBackTemplate", con);
                cmd.Parameters.Add(new SqlParameter("@TraingID", Convert.ToInt32(TrainingID)));
                cmd.Parameters.Add(new SqlParameter("@AtnID", Convert.ToInt32(AtnID)));
                cmd.Parameters.Add(new SqlParameter("@EmpNo", EmpNo));
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


        protected void btnFeedBackSave_Click(object sender, EventArgs e)
        {
            this.InitSaveFeedBackTemplate(txtFDBTrainingID.Text.ToString(), txtAtnID.Text.ToString(), txtEmpNo.Text.ToString());
        }

        //https://www.c-sharpcorner.com/UploadFile/ff2f08/table-value-parameter-use-with-C-Sharp/
        //https://www.aspsnippets.com/Articles/Pass-Table-Valued-Parameters-to-Stored-Procedure-from-Code-Behind-using-ADONet-C-and-VBNet.aspx
        //https://www.aspsnippets.com/Articles/Pass-Table-Valued-Parameters-to-Stored-Procedure-from-Code-Behind-using-ADONet-C-and-VBNet.aspx

        private void InitSaveFeedBackTemplate(string TrainingID , string UserID , string EmpNo)
        {
            int result = 0;

            if (Session["ISEdit_TFRULink"].ToString().Equals("1",StringComparison.CurrentCultureIgnoreCase) )
            {
                
                //for isertion
                for (int i = 0; i < FeedBackMasterGrdInitTemplate.Rows.Count; i++)
                {
                    string FID = FeedBackMasterGrdInitTemplate.Rows[i].Cells[0].Text.ToString();
                    string FIDMSG = FeedBackMasterGrdInitTemplate.Rows[i].Cells[1].Text.ToString();
                    string RID = ((DropDownList)FeedBackMasterGrdInitTemplate.Rows[i].FindControl("ddResponseType")).SelectedValue.ToString();
                    string RIDMSG = ((DropDownList)FeedBackMasterGrdInitTemplate.Rows[i].FindControl("ddResponseType")).SelectedItem.ToString();

                    result = this.SaveFeedBackTemplate(TrainingID, UserID, EmpNo, FID, RID, Session["ISEdit_TFRULink"].ToString(), "-1");


                }

            }
            else  if (Session["ISEdit_TFRULink"].ToString().Equals("2",StringComparison.CurrentCultureIgnoreCase) )
            {
                //for updation 
                for (int i = 0; i < FeedBackMasterGrdEditTemplate.Rows.Count; i++)
                {
                    string FID = FeedBackMasterGrdEditTemplate.Rows[i].Cells[0].Text.ToString();
                    string FIDMSG = FeedBackMasterGrdEditTemplate.Rows[i].Cells[1].Text.ToString();
                    string RID = ((DropDownList)FeedBackMasterGrdEditTemplate.Rows[i].FindControl("ddResponseType")).SelectedValue.ToString();
                    string RIDMSG = ((DropDownList)FeedBackMasterGrdEditTemplate.Rows[i].FindControl("ddResponseType")).SelectedItem.ToString();
                    string TFRULinkID = FeedBackMasterGrdEditTemplate.Rows[i].Cells[3].Text.ToString();
                    result = this.SaveFeedBackTemplate(TrainingID, UserID, EmpNo, FID, RID, Session["ISEdit_TFRULink"].ToString(), TFRULinkID);


                }

            }




        }

        private int SaveFeedBackTemplate(string TrainingID, string AtnID, string EmpNo, string FID, string RID, string TransType, string MasterRecordID)
       {
           int r = 0;

            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("SaveFeedBackTemplate", con);
                cmd.Parameters.Add(new SqlParameter("@TraingID", Convert.ToInt32(TrainingID)));
                cmd.Parameters.Add(new SqlParameter("@AtnID", Convert.ToInt32(AtnID)));
                cmd.Parameters.Add(new SqlParameter("@EmpNo", EmpNo));
                cmd.Parameters.Add(new SqlParameter("@FID", Convert.ToInt32(FID)));
                cmd.Parameters.Add(new SqlParameter("@RID", Convert.ToInt32(RID)));
                cmd.Parameters.Add(new SqlParameter("@TransType", Convert.ToInt32(TransType)));
                cmd.Parameters.Add(new SqlParameter("@MasterRecordID", Convert.ToInt32(MasterRecordID)));
                cmd.Parameters.Add(new SqlParameter("@RecordedBy",  Session["thisUserName"]));
                cmd.CommandType = CommandType.StoredProcedure;

                r = cmd.ExecuteNonQuery();
           
            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }

            return r;


       }




    }
}