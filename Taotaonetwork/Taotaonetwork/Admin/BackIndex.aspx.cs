using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using BLL;

namespace Taotaonetwork.Admin
{
    public partial class BackIndex : System.Web.UI.Page
    {
        public static string usernames;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static bool logins(string username, string paw)
        {
            User user = new User();
            user.user_name = username;
            user.pwd = paw;
            if (LoginBLL.BackLogins(user))
            {
                usernames = username;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}