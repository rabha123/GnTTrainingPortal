using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SAP.Middleware.Connector;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GnTAMRDashboard.SAPManager
{
    public class SAPManager
    {

        public Dictionary<string, string> GetEmployeeInfoFromSAP(string empno)
        {

            Dictionary<string, string> s = new Dictionary<string, string>();


            #region !----------------Connection Pooling Code-------------------!

            RfcConfigParameters rfc = SetRFCParameters();

            RfcDestination rfcDest = RfcDestinationManager.GetDestination(rfc);

            RfcRepository rfcRep = rfcDest.Repository;

            #endregion

            #region !----------------Function Calling Code-------------------!

            IRfcFunction function = rfcRep.CreateFunction("ZSA_HCM_EMP_INFORMATION");
            function.SetValue("PERNR_1", empno);
            //if (emailAddress == string.Empty)
            //{
            //    function.SetValue("PERNR_1", Session["NewEmpID"].ToString());
            //}
            //else
            //{
            //    function.SetValue("EMAIL", emailAddress);
            //}

            function.Invoke(rfcDest);

            string EmployeeCode = function.GetValue("PERNR").ToString();
       
            string emailID = function.GetValue("EMAIL_ID").ToString();
            string employeeName = function.GetValue("ENAME").ToString();
            string Position = function.GetValue("PLSTX").ToString();
            string Department = function.GetValue("ORGTX").ToString();
            string ConsumerNumber = function.GetValue("WAUSW").ToString();
            string AccountNumber = function.GetValue("KFZKZ").ToString();
            string City = function.GetValue("CITY").ToString();


            s.Add("EMAIL_ID", emailID);
            s.Add("ENAME", employeeName);
            s.Add("PLSTX", Position);
            s.Add("ORGTX", Department);

            //New Fields
            //string NTN = function.GetValue("INITS").ToString();
            //string Grade = function.GetValue("TRFGR").ToString();
            //string JobLevel = function.GetValue("TRFST").ToString();
            //string CostCentre = function.GetValue("KOSTL").ToString();
            //string DateOfJoining = function.GetValue("DAT01").ToString();
            //string EmailAddress = function.GetValue("USRID_LONG").ToString();
            //string ResidentialAddress = function.GetValue("STRAS_TEMP").ToString();

            //New Fields2
            //string OfficeLocation = function.GetValue("OFF_LOC").ToString();
            //string EOBINumber = function.GetValue("EOBI").ToString();
            //string CNIC = function.GetValue("NAME2").ToString();
            //string EmployeeGender = function.GetValue("GENDER").ToString();
            //string DOB = function.GetValue("DOB").ToString();
            //string IPnumber = function.GetValue("IP_NUM").ToString();
            //string CellNumber1 = function.GetValue("CELL1").ToString();
            //string CellNumber2 = function.GetValue("CELL2").ToString();
            //string LandlineNo = function.GetValue("LAND_NUM").ToString();
            //string MaritalStatus = function.GetValue("MARITIAL_STATUS").ToString();
            //string DateOfMarraige = function.GetValue("FAMDT").ToString();
            //

            //Phase 2 New Master Feilds -- 20-Jul-2017
            //string FirstName = function.GetValue("FIRST_NAME").ToString();
            //string LastName = function.GetValue("LAST_NAME").ToString();

            //string EOBIRegDate = function.GetValue("EOBI_RDATE").ToString();
            //string Domicile = function.GetValue("NAMZU").ToString();
            //string MotherTougue = function.GetValue("MOTHER_TONGUE").ToString();
            //string NativePlace = function.GetValue("NATIVE_PLACE").ToString();
            //string EmergencyContactNumber = function.GetValue("CONTACTNO_KIN").ToString();
            //string DepartmentGroup = function.GetValue("GROUP").ToString();
            //string Region = function.GetValue("REGION").ToString();
            //string SubDepartment = function.GetValue("SUB_DEPARTMENT").ToString();
            //string Cluster = function.GetValue("CLUSTER").ToString();
            //string DesignationLevel = function.GetValue("LEVEL").ToString();
            //string LineMgrEmpNo = function.GetValue("MANAGER_PENR").ToString();
            //string LineMgrName = function.GetValue("MANAGER_NAME").ToString();
            //string LineMgrDesignation = function.GetValue("MANAGER_JOB").ToString();


           

            /******************* End  *********************/
            #endregion


            return s;
        }



        public Dictionary<string, string> GetEmployeeInfoFromSAPByEmailAddress(string emailAddress)
        {
            Dictionary<string, string> s = new Dictionary<string, string>();



            RfcConfigParameters rfc = SetRFCParameters();

            RfcDestination rfcDest = RfcDestinationManager.GetDestination(rfc);

            RfcRepository rfcRep = rfcDest.Repository;

        


            IRfcFunction function = rfcRep.CreateFunction("ZSA_HCM_EMP_INFORMATION");

            if (emailAddress == string.Empty)
            {
                function.SetValue("PERNR_1", string.Empty);
            }
            else
            {
                function.SetValue("EMAIL", emailAddress);
            }

            function.Invoke(rfcDest);

            string EmployeeCode = function.GetValue("PERNR").ToString();

            string emailID = function.GetValue("EMAIL_ID").ToString();
            string employeeName = function.GetValue("ENAME").ToString();
            string Position = function.GetValue("PLSTX").ToString();
            string Department = function.GetValue("ORGTX").ToString();
            string ConsumerNumber = function.GetValue("WAUSW").ToString();
            string AccountNumber = function.GetValue("KFZKZ").ToString();
            string City = function.GetValue("CITY").ToString();


            s.Add("EMAIL_ID", emailID);
            s.Add("ENAME", employeeName);
            s.Add("PLSTX", Position);
            s.Add("ORGTX", Department);
            s.Add("PERNR", EmployeeCode);



            return s;
            

        }


        private RfcConfigParameters SetRFCParameters()
        {

            DataSet dsConfig = new DataSet();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ncerpDevConnectionString"].ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("Select * From ncSAPConfigurationDetails Where IsActive = 1");
            cmd.Connection = conn;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dsConfig);

            cmd.Dispose();
            conn.Dispose();

            RfcConfigParameters rfc = new RfcConfigParameters();
            rfc.Add(RfcConfigParameters.Name, dsConfig.Tables[0].Rows[0][1].ToString());
            rfc.Add(RfcConfigParameters.AppServerHost, dsConfig.Tables[0].Rows[0][2].ToString());
            //rfc.Add(RfcConfigParameters.AppServerHost, "winapp1");
            rfc.Add(RfcConfigParameters.Client, dsConfig.Tables[0].Rows[0][3].ToString());
            rfc.Add(RfcConfigParameters.User, dsConfig.Tables[0].Rows[0][4].ToString());
            rfc.Add(RfcConfigParameters.Password, dsConfig.Tables[0].Rows[0][5].ToString());
            rfc.Add(RfcConfigParameters.SystemNumber, dsConfig.Tables[0].Rows[0][6].ToString());
            rfc.Add(RfcConfigParameters.Language, dsConfig.Tables[0].Rows[0][7].ToString());
            rfc.Add(RfcConfigParameters.PoolSize, dsConfig.Tables[0].Rows[0][8].ToString());
            rfc.Add(RfcConfigParameters.PeakConnectionsLimit, dsConfig.Tables[0].Rows[0][9].ToString());
            rfc.Add(RfcConfigParameters.IdleTimeout, dsConfig.Tables[0].Rows[0][10].ToString());

            #region oldCode
            //Dev
            // RfcConfigParameters rfc = new RfcConfigParameters();
            //rfc.Add(RfcConfigParameters.Name, "ZAK_NCINT");
            //rfc.Add(RfcConfigParameters.AppServerHost, "172.17.200.13");
            //rfc.Add(RfcConfigParameters.Client, "200");
            //rfc.Add(RfcConfigParameters.User, "NCINT_ISUDEV");
            //rfc.Add(RfcConfigParameters.Password, "S@p12345");

            ////rfc.Add(RfcConfigParameters.User, "aftabalam");
            ////rfc.Add(RfcConfigParameters.Password, "kleine71");
            //rfc.Add(RfcConfigParameters.SystemNumber, "0");
            //rfc.Add(RfcConfigParameters.Language, "en");
            //rfc.Add(RfcConfigParameters.PoolSize, "5");
            //rfc.Add(RfcConfigParameters.PeakConnectionsLimit, "10");
            //rfc.Add(RfcConfigParameters.IdleTimeout, "100");

            //QA
            //RfcConfigParameters rfc = new RfcConfigParameters();
            //rfc.Add(RfcConfigParameters.Name, "NCINT_ISUQAS");
            //rfc.Add(RfcConfigParameters.AppServerHost, "172.17.200.173");
            //rfc.Add(RfcConfigParameters.Client, "400");
            //rfc.Add(RfcConfigParameters.User, "NCINT_ISUQAS");
            //rfc.Add(RfcConfigParameters.Password, "S@p12345");

            ////rfc.Add(RfcConfigParameters.User, "aftabalam");
            ////rfc.Add(RfcConfigParameters.Password, "kleine71");
            //rfc.Add(RfcConfigParameters.SystemNumber, "0");
            //rfc.Add(RfcConfigParameters.Language, "en");
            //rfc.Add(RfcConfigParameters.PoolSize, "5");
            //rfc.Add(RfcConfigParameters.PeakConnectionsLimit, "10");
            //rfc.Add(RfcConfigParameters.IdleTimeout, "100");
            #endregion


            return rfc;

        }


    }
}