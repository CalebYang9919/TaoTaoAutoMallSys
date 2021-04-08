using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using DAL;

namespace BLL
{
    public class LoginBLL
    {
        public static bool Logins(User user)
        {
            return LoginDAL.Logins(user);
        }

        public static bool BackLogins(User user)
        {
            return LoginDAL.BackLogins(user);
        }

        /// <summary>
        /// 前台登录返回用户ID
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static List<User> Loginss(User user)
        {
            return LoginDAL.Loginss(user);
        }
    }
}
