using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace GnTAMRDashboard.SecurityManager
{
    public class ConnectionManager
    {
        public string getSecureConnectionString()
        {

            

            string secureConString =
                  (ConfigurationManager.ConnectionStrings["UATSecurencerpConnectionString"].ConnectionString.ToString()
                  .Replace("@conServerName", SecurityManager.decrypt(ConfigurationManager.AppSettings["conServerName"].ToString(), SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conDataSource", SecurityManager.decrypt(ConfigurationManager.AppSettings["conDataSource"].ToString(), SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conName", SecurityManager.decrypt(ConfigurationManager.AppSettings["conName"].ToString(), SecurityManager.getPasswordKey()).Trim())
                  .Replace("@conPassword", SecurityManager.decrypt(ConfigurationManager.AppSettings["conPassword"].ToString(), SecurityManager.getPasswordKey()).Trim())).Trim().ToString();


            string secureConStringPRD =
                (ConfigurationManager.ConnectionStrings["PRDSecurencerpConnectionString"].ConnectionString.ToString()
                .Replace("@conServerNamePRD", SecurityManager.decrypt(ConfigurationManager.AppSettings["conServerNamePRD"].ToString(), SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conDataSourcePRD", SecurityManager.decrypt(ConfigurationManager.AppSettings["conDataSourcePRD"].ToString(), SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conNamePRD", SecurityManager.decrypt(ConfigurationManager.AppSettings["conNamePRD"].ToString(), SecurityManager.getPasswordKeyPRD()).Trim())
                .Replace("@conPasswordPRD", SecurityManager.decrypt(ConfigurationManager.AppSettings["conPasswordPRD"].ToString(), SecurityManager.getPasswordKeyPRD()).Trim())).Trim().ToString();


            return secureConStringPRD;


        }
        public string getInSecureConnectionString()
        {
            string ConString = (ConfigurationManager.ConnectionStrings["ncerpDevConnectionString"].ConnectionString.ToString());

            return ConString;
        }

    }
}