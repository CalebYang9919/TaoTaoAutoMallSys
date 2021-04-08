using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data;

namespace DAL
{
    public class LoginDAL
    {
        /// <summary>
        /// 前台登录
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static bool Logins(User user){
            string sql=string.Format("select id from users where user_name='{0}' and pwd='{1}' and user_type=1",user.user_name,user.pwd);
            DataTable dt=DBHelper.GetDataTable(sql);
            if(dt.Rows.Count==1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        /// <summary>
        /// 前台登录返回用户ID
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static List<User> Loginss(User user)
        {
            string sql = string.Format("select * from users where user_name='{0}' and pwd='{1}' and user_type=1", user.user_name, user.pwd);
            DataTable dt = DBHelper.GetDataTable(sql);
            List<User> list = new List<User>();
            if (dt.Rows.Count == 1)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    User users = new User();
                    user.id = int.Parse(dr["id"].ToString());
                    user.email = dr["email"].ToString();
                    user.user_name = dr["user_name"].ToString();
                    user.pwd = dr["pwd"].ToString();
                    user.mobile = dr["mobile"].ToString();
                    user.user_type = int.Parse(dr["user_type"].ToString());
                    list.Add(users);
                }
                return list;
            }
            else
            {
                return list;
            }

        }

        /// <summary>
        /// 后台登录
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static bool BackLogins(User user)
        {
            string sql = string.Format("select id from users where user_name='{0}' and pwd='{1}' and user_type=0", user.user_name, user.pwd);
            DataTable dt = DBHelper.GetDataTable(sql);
            if (dt.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}
