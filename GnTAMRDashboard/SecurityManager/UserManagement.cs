using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

using System.DirectoryServices.ActiveDirectory;
using System.Threading.Tasks;
using System.DirectoryServices;


namespace GnTAMRDashboard.SecurityManager
{
    public class UserManagement
    {
        DirectorySearcher ds = null;
        public bool validateFromActiveDirectory(string userid, string password)
        {
            try
            {
                DirectoryEntry de = new DirectoryEntry("LDAP://" + GetSystemDomain(), userid, password);
                ds = new DirectorySearcher(de);

                ds.Filter = "(&((&(objectCategory=Person)(objectClass=User)))(samaccountname=" + userid + "))";
                SearchResult userObject = ds.FindOne();


                if (userObject != null)
                {
                    //HttpContext.Current.Session["userid"] = userid;
                    //HttpContext.Current.Session["regionid"] = "R1";
                    //HttpContext.Current.Session["name"] = userObject.Properties["name"][0].ToString();
                    if (chkSystemUser(userid))
                    {
                        //// updateDeptDesigInfo(userid, userObject.Properties["department"][0].ToString(), userObject.Properties["title"][0].ToString(), userObject.Properties["mail"][0].ToString());
                        //if (updateToken(userid) != 0)
                        //{
                        //    updateDeptDesigInfo(userid, userObject.Properties["department"][0].ToString(), userObject.Properties["title"][0].ToString(), userObject.Properties["mail"][0].ToString());
                        //    return true;
                        //}
                        //else
                        //{
                        //    return false;
                        //}
                        //insertLog(userid);
                        return true;

                    }
                    else
                    {
                        // insertDisableUser(userid);

                        //                        eml.Subject = "WEB GIS Request";
                        //                        eml.BodyText = "<html xmlns='http://www.w3.org/1999/xhtml'>" +
                        //"<head runat='server'>" +
                        //"    <title></title>" +
                        //"    <style type='text/css'>.style1{width: 100%;color: #000000;font-size: small;}" +
                        //" table, th, td{border: 1px solid black;border-collapse:collapse;} </style></head>" +
                        //"<body>" +
                        //"    <form id='form1' runat='server'><div>" +
                        //"    Dear User," +
                        //"        <br /> <br />" +
                        //"        Your login attempt for WebGIS access has been Identified, to avail WebGIS access please raise a request! " +
                        //"         <br /> <br />To raise a request click<a href='http://sharepointapp:424/sites/home/departments/ITG/SAP/Lists/GIS%20Requests/NewForm2_ali.aspx?RootFolder'>here</a>." +
                        //"        <br /> <br />" +
                        //"        <table class='style1' > <tr><td>&nbsp;</td><td> &nbsp;</td><td> &nbsp;</td> <td>&nbsp;</td>" +
                        //"            </tr><tr><td>Name:</td><td> " + userObject.Properties["displayname"][0].ToString() + "</td><td> Designation:</td> <td> " + userObject.Properties["title"][0].ToString() + "</td></tr><tr> <td>Department:</td><td>" +
                        //"                    " + userObject.Properties["department"][0].ToString() + "</td><td>Office Address:</td><td> " + userObject.Properties["physicaldeliveryofficename"][0].ToString() + "</td> </tr><tr> <td>Request Link:</td>" +
                        //"                <td> <a href='http://sharepointapp:424/sites/home/departments/ITG/SAP/Lists/GIS%20Requests/NewForm2_ali.aspx?RootFolder'>Click here</a></td><td> User Name:</td><td> " + userObject.Properties["samaccountname"][0].ToString() + "</td></tr><tr><td> &nbsp;</td><td>&nbsp;</td> <td>&nbsp;</td>" +
                        //"                <td> &nbsp;</td></tr><tr> <td colspan='4'>This is an auto generated email.</td></tr></table>" +
                        //"     </div></form></body></html>";
                        //                        eml.ToAddress = userObject.Properties["mail"][0].ToString();
                        //                        string s = ConfigurationManager.AppSettings["cc"].ToString();
                        //                        eml.ArrCC.AddRange(s.Split(new char[] { ',' }));
                        //                        eml.sendMailByExchangeServer();
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
            catch (DirectoryServicesCOMException dce)
            {
                //need to change
                return false;
            }
            catch (Exception x)
            {

                throw x;

            }
        }


        private string GetSystemDomain()
        {
            try
            {
                return Domain.GetComputerDomain().ToString().ToLower();
            }
            catch (Exception e)
            {
                e.Message.ToString();
                return string.Empty;
            }
        }

        bool chkSystemUser(string username)
        {
            bool b = false;
            DataTable dt = this.getSelectedUserDetails(username);
            if (dt.Rows.Count > 0)
            {
                b = true;
            }
            else
            {
                b = false;
            }

            return b;
        }



        public int ActivateDeactivateUser(int userID, int isActive)
        {
            int result = 0;
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("ActivateDeactivateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(userID));
                cmd.Parameters.AddWithValue("@isActive", Convert.ToInt32(isActive));
                result = cmd.ExecuteNonQuery();

            }
            catch (Exception)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }
            return result;
        }



        public DataTable getUserDetails()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("getUserDetails", con);
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


        public DataTable getSelectedUserDetails(string UserName)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("getSelectedUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", UserName);
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





        public DataTable CreateUser(string userName, int roleID, int PlantID,int trainingTypeID, string loggedInUserName)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("CreateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@RoleID", Convert.ToInt32(roleID));
                cmd.Parameters.AddWithValue("@TrainingTypeID", Convert.ToInt32(trainingTypeID));
                cmd.Parameters.AddWithValue("@PlantID", Convert.ToInt32(PlantID));
                cmd.Parameters.AddWithValue("@logInUserName", loggedInUserName);
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



        public DataTable EditUserConfiguration(string UserID, string userName, int roleID, int PlantID, int trainingTypeID, string loggedInUserName)
        {

            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("EditUserConfiguration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserID));
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@RoleID", Convert.ToInt32(roleID));
                cmd.Parameters.AddWithValue("@TrainingTypeID", Convert.ToInt32(trainingTypeID));
                cmd.Parameters.AddWithValue("@PlantID", Convert.ToInt32(PlantID));
                cmd.Parameters.AddWithValue("@logInUserName", loggedInUserName);
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




        public int CreateAttendee(string TrainigID, string empNo, string empName, string designation, string department)
        {
            int x=0;

            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("addAttendees", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TrainingID", Convert.ToInt32(TrainigID));
                cmd.Parameters.AddWithValue("@EmpNo", empNo);
                cmd.Parameters.AddWithValue("@EmpName", empName);
                cmd.Parameters.AddWithValue("@Designation", designation);
                cmd.Parameters.AddWithValue("@Department", department);

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

            return x;


        }





        public DataTable SaveTraining(string CourseTitle, string TrainerName, string Department, string Location, int PlantID,
            int TrainingTypeID, string TrainingStartTime, string TrainingEndTime , string RegisterBy ,string TrainingDate)
        {
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(new ConnectionManager().getInSecureConnectionString());
            con.Open();
            try
            {

//               @TrainingDate  datetime, @CourseTitle varchar(max),
//@TrainerName varchar(max),@Department varchar(max),@Location varchar(max),
//@PlantID bigint,@TrainingTypeID bigint,@TrainingStartTime varchar(max),
//@TrainingEndTime varchar(max),@RegisterBy varchar(max) 


                SqlCommand cmd = new SqlCommand("SaveTraining", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CourseTitle", CourseTitle);
                cmd.Parameters.AddWithValue("@TrainerName", TrainerName);
                cmd.Parameters.AddWithValue("@Department", Department);
                cmd.Parameters.AddWithValue("@Location", Location);
                cmd.Parameters.AddWithValue("@PlantID", Convert.ToInt32(PlantID));
                cmd.Parameters.AddWithValue("@TrainingTypeID", Convert.ToInt32(TrainingTypeID));
                cmd.Parameters.AddWithValue("@TrainingStartTime", TrainingStartTime);
                cmd.Parameters.AddWithValue("@TrainingEndTime", TrainingEndTime);
                cmd.Parameters.AddWithValue("@RegisterBy", RegisterBy);
                cmd.Parameters.AddWithValue("@TrainingDate", Convert.ToDateTime(TrainingDate));

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




   

    }
}