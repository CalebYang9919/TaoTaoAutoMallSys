using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using BLL;
using System.Web.Services;


namespace TaotaonetworkUI
{
    public partial class Register : System.Web.UI.Page
    {

        private const String host = "http://dingxin.market.alicloudapi.com";
        private const String path = "/dx/sendSms";
        private const String method = "POST";
        private const String appcode = "2dfc5b92a92948beb8892e77832dc0b4";

        public static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true;
        }

        //发送验证码
        [WebMethod]
        public static int yzm(string tel)
        {
            Random random = new Random();
            int code = random.Next(100000, 1000000);
            String querys = "mobile=" + tel + "&param=code%3A" + code + "&tpl_id=TP1711063";
            String bodys = "";
            String url = host + path;
            HttpWebRequest httpRequest = null;
            HttpWebResponse httpResponse = null;

            if (0 < querys.Length)
            {
                url = url + "?" + querys;
            }

            if (host.Contains("https://"))
            {
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                httpRequest = (HttpWebRequest)WebRequest.CreateDefault(new Uri(url));
            }
            else
            {
                httpRequest = (HttpWebRequest)WebRequest.Create(url);
            }
            httpRequest.Method = method;
            httpRequest.Headers.Add("Authorization", "APPCODE " + appcode);
            if (0 < bodys.Length)
            {
                byte[] data = Encoding.UTF8.GetBytes(bodys);
                using (Stream stream = httpRequest.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }
            }
            try
            {
                httpResponse = (HttpWebResponse)httpRequest.GetResponse();
            }
            catch (WebException ex)
            {
                httpResponse = (HttpWebResponse)ex.Response;
            }


            //Console.WriteLine(httpResponse.StatusCode);
            //Console.WriteLine(httpResponse.Method);
            //Console.WriteLine(httpResponse.Headers);
            //Stream st = httpResponse.GetResponseStream();
            //StreamReader reader = new StreamReader(st, Encoding.GetEncoding("utf-8"));
            //Console.WriteLine(reader.ReadToEnd());
            //Console.WriteLine("\n");
            return code;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //注册
        [WebMethod]
        public static bool show(String username,string pwd,string email,string mobile)   //必须是公共的静态方法 static
        {
            return RegisterBLL.Register(username, pwd, email, mobile);
        }

        //用户名是否存在
        [WebMethod]
        public static bool isusername(String username)   //必须是公共的静态方法 static
        {
            return RegisterBLL.IsUserName(username);
        }

    }
}