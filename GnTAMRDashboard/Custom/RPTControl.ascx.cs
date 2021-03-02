using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GnTAMRDashboard.Custom
{
    public partial class RPTControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        protected void grdProgressChildGrdRPT_BeforePerformDataSelect(object sender, EventArgs e)
        {
            try
            {

                ASPxGridView grd;
                grd = sender as ASPxGridView;
                Session["TRAINING_MASTER_ID_RPT"] = grd.GetMasterRowKeyValue();

            }
            catch (Exception)
            {


            }
        }

        protected void btnReportExport_Click(object sender, EventArgs e)
        {
            //export log report//
            //ASPxGridViewExporter1.WriteXlsxToResponse();
            // i.WriteXlsxToResponse("LDC-LOG", true);
            this.Export(ASPxGridViewExporter1);
            //this.ExportGridToExcel(RequestLogGrd);
        }



        private void Export(ASPxGridViewExporter i)
        {
            try
            {
                i.WriteXlsxToResponse("Report", true);
            }
            catch (Exception)
            {

            }

        }



        private void ExportGridToExcel(DevExpress.Web.ASPxGridView.ASPxGridView RequestLogGrd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "LDC-Report" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            //RequestLogGrd.GridLines = GridLines.Both;
            //RequestLogGrd.HeaderStyle.Font.Bold = true;
            RequestLogGrd.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        //protected void GetAttendeesByTrainingIDDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        //{

        //}



        //protected void grdProgressChildGrd_BeforePerformDataSelect(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        ASPxGridView grd;
        //        grd = sender as ASPxGridView;
        //        Session["TRAINING_MASTER_ID_RPT"] = grd.GetMasterRowKeyValue();

        //    }
        //    catch (Exception)
        //    {


        //    }

        //}


    }
}