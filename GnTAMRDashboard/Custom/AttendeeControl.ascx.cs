using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    public partial class AttendeeControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAttendeeSave_Click(object sender, EventArgs e)
        {
            if (comboTrainingMaster.SelectedIndex>=0)
            {
                if (((string.IsNullOrEmpty(txtEmpNo.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtEmpNo.Text.ToString()) == false)))
                {

                    if (((string.IsNullOrEmpty(txtEmpName.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtEmpName.Text.ToString()) == false)) &&
                           ((string.IsNullOrEmpty(txtEmpDesignation.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtEmpDesignation.Text.ToString()) == false)) &&
                           ((string.IsNullOrEmpty(txtEmpDept.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtEmpDept.Text.ToString()) == false)))
                    {

                        try
                        {

                            string tid = comboTrainingMaster.SelectedValue;
                            int r = new SecurityManager.UserManagement().CreateAttendee(tid, txtEmpNo.Text.ToString().Trim(),
                                    txtEmpName.Text.ToString(), txtEmpDesignation.Text.ToString(), txtEmpDept.Text.ToString());


                            txtEmpNo.Text = string.Empty;
                            txtEmpName.Text = string.Empty;
                            txtEmpDesignation.Text = string.Empty;
                            txtEmpDept.Text = string.Empty;

                            AttendeeGrd.DataBind();

                        }
                        catch (Exception ex)
                        {
                            
                                
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must contain trainig to proceed')", true);
            }

            
        }

        protected void btnValidateAttendee_Click(object sender, EventArgs e)
        {
            if (comboTrainingMaster.SelectedIndex>=0)
            {
                if (((string.IsNullOrEmpty(txtEmpNo.Text.ToString()) == false) && (string.IsNullOrWhiteSpace(txtEmpNo.Text.ToString()) == false)))
                {

                    Dictionary<string, string> d = new SAPManager.SAPManager().GetEmployeeInfoFromSAP(txtEmpNo.Text.ToString().Trim());
                    if (d.Count() > 0)
                    {
                        string empName = d["ENAME"] == null ? string.Empty : d["ENAME"].ToString();
                        string designation = d["PLSTX"] == null ? string.Empty : d["PLSTX"].ToString();
                        string dept = d["ORGTX"] == null ? string.Empty : d["ORGTX"].ToString();


                        if (((string.IsNullOrEmpty(empName) == false) && (string.IsNullOrWhiteSpace(empName) == false)) &&
                            ((string.IsNullOrEmpty(designation) == false) && (string.IsNullOrWhiteSpace(designation) == false)) &&
                            ((string.IsNullOrEmpty(dept) == false) && (string.IsNullOrWhiteSpace(dept) == false)))
                        {
                            txtEmpName.Text = empName;
                            txtEmpDesignation.Text = designation;
                            txtEmpDept.Text = dept;

                        }

                    }
                    else
                    {
                        txtEmpName.Text = string.Empty;
                        txtEmpDesignation.Text = string.Empty;
                        txtEmpDept.Text = string.Empty;
                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('provide mandatory parameters as required')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('must contain trainig to proceed')", true);
            }
        }


  


    }
}