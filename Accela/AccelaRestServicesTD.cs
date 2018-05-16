using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using TDCIDWebService.Accela;

namespace TDCIDWebService.Accela
{
    public class AccelaRestServicesTD
    {
        public static string AuthenticateUser(string agency, string username, string password)
        {
            var serializer = new JavaScriptSerializer();
            var serializedResult = serializer.Serialize(new Dictionary<string, string>
            {
                ["agency"] = agency,
                ["userId"] = username,
                ["password"] = password
            });

            var url = "/apis/agency/auth";

            dynamic output = SendRestRequest(url, "POST", serializedResult);
            return output.ContainsKey("result") ? output["result"] : null;
        }

        public static List<CheckInSummary> GetRestCheckIns(string token, string id, string fullName, string firstName, string middleName, string lastName, string openedDateFrom, string openedDateTo, string businessName, string description, string roomStatus, string statusDateFrom, string statusDateTo)
        {
            var recType = "Services/Unit/Check In/New";
            var serializer = new JavaScriptSerializer();
            var dictionary = new Dictionary<string, object>
            {
                ["id"] = id,
                ["openedDateFrom"] = openedDateFrom,
                ["openedDateTo"] = openedDateTo,
                ["statusDateFrom"] = statusDateFrom,
                ["statusDateTo"] = statusDateTo,
                ["description"] = !string.IsNullOrWhiteSpace(description)?"%" +description:string.Empty,
                ["type"] = new Dictionary<string, string>
                {
                    ["value"] = recType
                },
                ["professional"] = new Dictionary<string, string>
                {
                    ["businessName"] = businessName,
                    
                },
                ["contact"] = new Dictionary<string, string>
                {
                    ["fullName"] = fullName,
                    ["firstName"] = firstName,
                    ["middleName"] = middleName,
                    ["lastName"] = lastName
                },
                ["status"] = new Dictionary<string, string>
                {
                    ["value"] = roomStatus,

                },
            };

            dictionary = dictionary.RemoveNullAndWhiteSpaceValues();

            var serializedResult = serializer.Serialize(dictionary);

            var url = $"/apis/v4/search/records?token={token}&limit=100&sort=openedDate&expand=customForms,professionals,contacts";

            dynamic output = SendRestRequest(url, "POST", serializedResult);
            if (output.ContainsKey("result"))
            {
               return getCheckinSummaryList(serializer.Serialize(output["result"])); 
            }
            else
            {
                return null;
            }
        }

        public static List<CheckInSummary> getCheckinSummaryList(string output)
        {
            List<CheckInSummary> checkInSummaryList = new List<CheckInSummary>();
            var ser = new DataContractJsonSerializer(typeof(List<CheckInSummary>));
            using (var ms = new MemoryStream(Encoding.UTF8.GetBytes(output)))
            {
                checkInSummaryList = (List<CheckInSummary>)ser.ReadObject(ms);
            }
            
            return checkInSummaryList;
        }

        public static List<CheckInDetail> GetDetails(string token, string recordID)
        {
            var serializer = new JavaScriptSerializer();
            var serializedResult = serializer.Serialize(new Dictionary<string, string>
            {
                ["recordID"] = recordID
            });

            var url = $"/apis/v4/scripts/TD_GET_CHECKINS?token={token}";
            dynamic output = SendRestRequest(url, "POST", serializedResult);

            if (output.ContainsKey("result"))
            {
                //return output["result"]["Message"];
                return getCheckinDetailList(output["result"]["Message"]);
            }

            return null;
        }

        public static List<CheckInDetail> getCheckinDetailList(string output)
        {
            List<CheckInDetail> checkInDetailList = new List<CheckInDetail>();
            var ser = new DataContractJsonSerializer(typeof(List<CheckInDetail>));
            using (var ms = new MemoryStream(Encoding.UTF8.GetBytes(output)))
            {
                checkInDetailList = (List<CheckInDetail>)ser.ReadObject(ms);
            }

            return checkInDetailList;
        }

        public static byte[] GetBytesProxy(string token, string documentId, long length)
        {
            var bizServer = WebConfigurationManager.AppSettings["BizServer"];
            var url = $"/apis/v4/documents/{documentId}/download?token={token}";
            url = bizServer + url;
            
            byte[] buffer;
            Encoding encoding = Encoding.UTF8;
            Uri requestUri = new Uri(url);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            request.AllowAutoRedirect = false;
            request.Timeout = 0x4c4b40;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), encoding);
            using (MemoryStream stream2 = new MemoryStream())
            {
                int count = 0;
                byte[] buffer2 = new byte[length];
                while ((count = reader.BaseStream.Read(buffer2, 0, buffer2.Length)) > 0)
                {
                    stream2.Write(buffer2, 0, count);
                }
                buffer = stream2.ToArray();
            }
            reader.Close();
            return buffer;
        }

        public static List<LP> GetRestProfessionals(string token, string type)
        {
            var serializer = new JavaScriptSerializer();
            var serializedResult = serializer.Serialize(new Dictionary<string, object>
            {
                ["licenseType"] = new Dictionary<string, string>
                {
                    ["value"] = type,
                }
            });

            var url = $"/apis/v4/search/professionals?token={token}&limit=2000";
            dynamic output = SendRestRequest(url, "POST", serializedResult);

            if (output.ContainsKey("result"))
            {
                return getLPList(serializer.Serialize(output["result"]));
            }
            else
            {
                return null;
            }
        }
        public static List<LP> getLPList(string output)
        {
            List<LP> lpList = new List<LP>();
            var ser = new DataContractJsonSerializer(typeof(List<LP>));
            using (var ms = new MemoryStream(Encoding.UTF8.GetBytes(output)))
            {
                lpList = (List<LP>)ser.ReadObject(ms);
            }

            return lpList;
        }
        

        //REQUEST HELPERS
        public static dynamic SendRestRequest(string url, string method, string body)
        {
            var data = new byte[0];
            if (method.ToUpper().Equals("POST") || method.ToUpper().Equals("PUT"))
            {
                data = Encoding.UTF8.GetBytes(body);
            }

            return SendRestRequest(url, method, data);
        }

        public static dynamic SendRestRequest(string url, string method, byte[] data = null)
        {
            var bizServer = WebConfigurationManager.AppSettings["BizServer"];
            url = bizServer + url;

            var responseString = SendWebRequest(url, method, data);

            var serializer = new JavaScriptSerializer();

            dynamic output;
            try
            {
                // in case we fail to parse the json return an error
                output = serializer.Deserialize<object>(responseString);
            }
            catch (Exception e)
            {
                throw new Exception("", new Exception($"{method} request to {url} returned invalid JSON. Exception: {e.Message}"));
            }

            if (output.ContainsKey("status"))
            {
                var status = output["status"];

                if (status != 200)
                {
                    var errorMessage =
                        $"An error occured while trying to send a {method} request to {url}. Status: {status}, error code: {(output.ContainsKey("code") ? output["code"] : "Not Specified")}, message: {(output.ContainsKey("message") ? output["message"] : "Not Specified")}";
                    throw new Exception(output.ContainsKey("message") ? output["message"] : "", new Exception(errorMessage));
                }
            }

            // If the server returned a proper JSON but without a status we'll consider the request a success
            return output;
        }

        public static string SendWebRequest(string url, string method, byte[] data = null, bool useProxy = false)
        {
            if (string.IsNullOrWhiteSpace(url))
            {
                throw new ArgumentException("Request URL is required");
            }

            if (string.IsNullOrWhiteSpace(method))
            {
                throw new ArgumentException("Request Method is required");
            }

            data = data ?? new byte[0];

            if (method.ToUpper().Equals("POST") || method.ToUpper().Equals("PUT"))
            {
                if (data.Length == 0)
                {
                    throw new ArgumentException("Request Body is required");
                }
            }

            string responseString;
            try
            {

                var requestUri = new Uri(url);
                var request = (HttpWebRequest)WebRequest.Create(requestUri);
                request.Method = method;
                request.ContentType = "application/json";
                request.AllowAutoRedirect = false;
                request.Timeout = 300000;
                //request.Timeout = 500;

                if (useProxy)
                {
                    var proxy = WebConfigurationManager.AppSettings["proxy"];

                    if (proxy.Length > 0)
                    {
                        var webproxy = new WebProxy(proxy);
                        request.Proxy = webproxy;
                    }
                }

                if (method.ToUpper().Equals("POST") || method.ToUpper().Equals("PUT"))
                {
                    request.ContentLength = data.Length;

                    using (var stream = request.GetRequestStream())
                    {
                        stream.Write(data, 0, data.Length);
                    }
                }

                var response = (HttpWebResponse)GetResponseWithoutException(request);

                using (var stream = response.GetResponseStream())
                {
                    if (stream == null)
                    {
                        throw new Exception("", new Exception($"{method} request to {url} didn't return a response"));
                    }
                    var reader = new StreamReader(stream, Encoding.UTF8);
                    responseString = reader.ReadToEnd();
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message,
                    new Exception($"An exception occured while trying to send a {method} request to {url}. Exception: {e.Message}"));
            }

            if (string.IsNullOrEmpty(responseString))
            {
                throw new Exception("", new Exception($"{method} request to {url} didn't return a response"));
            }

            return responseString;
        }

        public static WebResponse GetResponseWithoutException(WebRequest request)
        {
            try
            {
                return request.GetResponse();
            }
            catch (WebException e)
            {
                if (e.Response == null)
                {
                    throw;
                }
                return e.Response;
            }
        }
    }
}