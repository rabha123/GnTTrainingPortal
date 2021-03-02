using DevExpress.Web.ASPxGridView;
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
    public partial class APRPWRControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ApprovalTrainingGrd_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {
                return;
            }
            else
            {
                if (e.GetValue("Status").ToString().Equals("Approve", StringComparison.CurrentCultureIgnoreCase))
                {
                    try
                    {
                        e.Row.BackColor = System.Drawing.Color.LightGreen;

                        e.Row.Cells[13].Enabled = false;
                       // ASPxGridView g = sender as ASPxGridView;
                        //((GridViewCommandColumn)ASPxGridView1.Columns["CommandColumn"]).EditButton.Visible = Convert.ToBoolean(e.Parameters);

                    }
                    catch (Exception)
                    {

                    }
                }
                //else if (e.GetValue("Status").ToString().Equals("Approve", StringComparison.CurrentCultureIgnoreCase))
                //{
                //    try
                //    {
                //        e.Row.BackColor = System.Drawing.Color.LightPink;
                //    }
                //    catch (Exception)
                //    {

                //    }


                //}

            }
        }


        protected void grdProgressChildGrd_BeforePerformDataSelect(object sender, EventArgs e)
        {
            //try
            //{

            //    ASPxGridView grd;
            //    grd = sender as ASPxGridView;
            //    Session["TRAINING_MASTER_ID"] = grd.GetMasterRowKeyValue();

            //}
            //catch (Exception)
            //{


            //}
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


        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                List<object> sRow = new SecurityManager.DAL().getSelectedValues(ApprovalTrainingGrd);
                if (sRow.Count() > 0)
                {
                    if ((sRow.ElementAt(0) is Array))
                    {
                        string TrainingID = (sRow.ElementAt(0) as Array).GetValue(0).ToString();
                        if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(0).ToString())))
                        {
                            DataTable dt = this.GetAttendeesCountByTrainingID((sRow.ElementAt(0) as Array).GetValue(0).ToString());
                            if (dt.Rows.Count > 0)
                            {
                                if (Convert.ToInt32(dt.Rows[0]["rcount"].ToString()) > 0)
                                {
                                    //must be approved by approver or power user..
                                    if ((Convert.ToInt32(Session["thisRoleID"]) == 2) || (Convert.ToInt32(Session["thisRoleID"]) == 4))
                                    {
                                        //training must be in pending state
                                        string tStatus = (sRow.ElementAt(0) as Array).GetValue(9).ToString().Trim();
                                        if ((sRow.ElementAt(0) as Array).GetValue(9).ToString().Equals("Pending", StringComparison.CurrentCultureIgnoreCase))
                                        {

                                            int r = this.ApproveSelectedTraining((sRow.ElementAt(0) as Array).GetValue(0).ToString(), Session["thisUserName"].ToString());
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Done')", true);

                                            ApprovalTrainingGrd.DataBind();

                                        }
                                        else if ((sRow.ElementAt(0) as Array).GetValue(9).ToString().Equals("Approve", StringComparison.CurrentCultureIgnoreCase))
                                        {
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('selected training already approved')", true);
                                        }


                                    }
                                    else
                                    {
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('you are not authorized for training approval')", true);
                                    }


                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('training to approved must contain attendees')", true);
                                }
                            }
                        }

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select rows to proceed')", true);
                }

            }
            catch (Exception)
            {


            }
        }



        protected void btnUnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                List<object> sRow = new SecurityManager.DAL().getSelectedValues(ApprovalTrainingGrd);
                if (sRow.Count() > 0)
                {
                    if ((sRow.ElementAt(0) is Array))
                    {
                        string TrainingID = (sRow.ElementAt(0) as Array).GetValue(0).ToString();
                        if ((SecurityManager.SecurityManager.IsNumeric((sRow.ElementAt(0) as Array).GetValue(0).ToString())))
                        {
                            DataTable dt = this.GetAttendeesCountByTrainingID((sRow.ElementAt(0) as Array).GetValue(0).ToString());
                            if (dt.Rows.Count > 0)
                            {
                                if (Convert.ToInt32(dt.Rows[0]["rcount"].ToString()) > 0)
                                {
                                    //must be approved by approver or power user..or uapprovedd by power user..
                                    if ((Convert.ToInt32(Session["thisRoleID"]) == 2) || (Convert.ToInt32(Session["thisRoleID"]) == 4))
                                    {
                                        //training must be in pending state
                                        string tStatus = (sRow.ElementAt(0) as Array).GetValue(9).ToString().Trim();
                                        if ((sRow.ElementAt(0) as Array).GetValue(9).ToString().Equals("Approve", StringComparison.CurrentCultureIgnoreCase))
                                        {

                                            int r = this.UnApproveSelectedTraining((sRow.ElementAt(0) as Array).GetValue(0).ToString(), Session["thisUserName"].ToString());
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Done')", true);
                                            ApprovalTrainingGrd.DataBind();

                                        }
                                        else if ((sRow.ElementAt(0) as Array).GetValue(9).ToString().Equals("Pending", StringComparison.CurrentCultureIgnoreCase))
                                        {
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('selected training already Pending')", true);
                                        }


                                    }
                                    else
                                    {
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('you are not authorized for training un-approval')", true);
                                    }


                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('training to unapproved must contain attendees')", true);
                                }
                            }
                        }

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must select rows to proceed')", true);
                }

            }
            catch (Exception)
            {


            }


        }



        //private void GetTrainingStatus(string TrainingID)
        //{

        //    bool b = false;

        //    DataTable dt = new DataTable();
        //    SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
        //    con.Open();
        //    try
        //    {

        //        SqlCommand cmd = new SqlCommand("GetAttendeesCountByTrainingID", con);
        //        cmd.Parameters.Add(new SqlParameter("@TrainingID", Convert.ToInt32(TrainingID)));
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(dt);
        //    }
        //    catch (Exception)
        //    {
        //        con.Close();
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }

        //    return dt;


        //}



        private DataTable GetAttendeesCountByTrainingID(string TrainingID)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("GetAttendeesCountByTrainingID", con);
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



        private int ApproveSelectedTraining(string TrainingID, string approvedBy)
        {
            int r = 0;

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@ApproveBy
                SqlCommand cmd = new SqlCommand("ApproveSelectedTraining", con);
                cmd.Parameters.Add(new SqlParameter("@TrainingID", Convert.ToInt32(TrainingID)));
                cmd.Parameters.Add(new SqlParameter("@ApproveBy", approvedBy));
                cmd.CommandType = CommandType.StoredProcedure;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //da.Fill(dt);

                cmd.ExecuteNonQuery();

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




        private int UnApproveSelectedTraining(string TrainingID, string RevertedBy)
        {
            int r = 0;

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                //@ApproveBy
                SqlCommand cmd = new SqlCommand("RevertSelectedTraining", con);
                cmd.Parameters.Add(new SqlParameter("@TrainingID", Convert.ToInt32(TrainingID)));
                cmd.Parameters.Add(new SqlParameter("@RevertedBy", RevertedBy));
                cmd.CommandType = CommandType.StoredProcedure;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //da.Fill(dt);

                cmd.ExecuteNonQuery();

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