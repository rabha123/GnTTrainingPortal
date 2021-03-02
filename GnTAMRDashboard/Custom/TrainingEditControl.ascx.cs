using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    public partial class TrainingEditControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdProgressChildGrd_BeforePerformDataSelect(object sender, EventArgs e)
        {
            try
            {

                ASPxGridView grd;
                grd = sender as ASPxGridView;
                Session["TRAINING_MASTER_ID"] = grd.GetMasterRowKeyValue();

            }
            catch (Exception)
            {


            }

        }

        protected void EditTrainingGrd_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            String s = e.Exception.Message;


            try
            {
                if (s.Count()>0)
                {
                    if (s.Contains("mandatoryerror"))
                    {
                        e.ErrorText = "unable to save changes, mandatory information missing";
                    }
                    else if (s.Contains("invalid time input"))
                    {
                        e.ErrorText = "unable to save changes, invalid time input";
                    }
                }
            }
            catch (Exception)
            {
               
            }

        }
    }

}