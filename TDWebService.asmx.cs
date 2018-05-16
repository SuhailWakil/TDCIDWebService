using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using TDCIDWebService.Accela;

namespace TDCIDWebService
{
    /// <summary>
    /// Summary description for TDWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class TDWebService : System.Web.Services.WebService
    {
        [WebMethod]
        public string AuthenticateUser(String user, String password)
        {
            try
            {
                return AccelaRestServicesTD.AuthenticateUser("DENVER", user, password);
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return "";
        }

       
        [WebMethod]
        public List<CheckInSummary> GetRestCheckIns(string token, string id, string fullName, string firstName, string middleName, string lastName, string openedDateFrom, string openedDateTo, string businessName, string description, string roomStatus, string statusDateFrom, string statusDateTo)
        {
            try
            {
                var ci = AccelaRestServicesTD.GetRestCheckIns(token, id, fullName, firstName, middleName, lastName, openedDateFrom, openedDateTo, businessName, description, roomStatus, statusDateFrom, statusDateTo);
                return ci;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return null;
        }

        [WebMethod]
        public List<CheckInDetail> GetCheckInsDetails(String token, String recordID)
        {
            try
            {
                var ci = AccelaRestServicesTD.GetDetails(token, recordID);
                return ci;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return null;
        }

        

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void getImage(string token, string documentId, long length)
        {
            var byteArr = AccelaRestServicesTD.GetBytesProxy(token, documentId, length);
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Length", byteArr.Length.ToString());
            HttpContext.Current.Response.ContentType = "image";
            HttpContext.Current.Response.BinaryWrite(byteArr);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.Close();
        }

        [WebMethod]
        public List<LP> GetRestProfessionals(string token, string type)
        {
            try
            {
                var ci = AccelaRestServicesTD.GetRestProfessionals(token, type);
                return ci;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return null;
        }

    }
}
