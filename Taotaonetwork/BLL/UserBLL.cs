using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Models;
using System.Data;


namespace BLL
{
    public class UserBLL
    {
        public static List<User> SelectUserInfo(string name)
        {
            return UserDAL.SelectUserInfo(name);
        }
        public static bool UpdateUserInfo(string name, string email, string moblie, string pic)
        {
            return UserDAL.UpdateUserInfo(name, email, moblie, pic);
        }

        /// <summary>
        /// 查询旧密码
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static DataTable SelectOldPassWord(int userid)
        {
            return UserDAL.SelectOldPassWord(userid);
        }
        public static bool UpdatePassWord(string pwd, int userid)
        {
            return UserDAL.UpdatePassWord(pwd, userid);
        }

    }
}
