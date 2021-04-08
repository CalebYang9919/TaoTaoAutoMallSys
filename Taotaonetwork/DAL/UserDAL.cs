using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class UserDAL
    {
        /// <summary>
        /// 实例化绑定
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="list"></param>
        public static void DataNew(DataTable dt, List<User> list)
        {
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    User use = new User();
                    //将dt行数据封装成对象
                    use.email = row["email"].ToString();
                    use.UserImg = row["userimg"].ToString();
                    use.mobile = row["mobile"].ToString();
                    //将对象加入到list中
                    list.Add(use);
                }
            }
        }
        /// <summary>
        /// 查询用户信息
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static List<User> SelectUserInfo(string name)
        {
            string sql = string.Format("select * from users where user_name='{0}'", name);
            DataTable dt = DBHelper.GetDataTable(sql);
            List<User> list = new List<User>();
            DataNew(dt, list);
            return list;
        }
        public static bool UpdateUserInfo(string name, string email, string moblie, string pic)
        {
            string sql = string.Format(@"update users set
[user_name] = '{0}', email = '{1}', mobile = '{2}', userimg = '{3}' where [user_name] = '{4}'", name, email, moblie, pic, name);
            return DBHelper.ExecuteNonQuery(sql);

        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="pwd"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool UpdatePassWord(string pwd, int userid)
        {
            string sql = string.Format(@"update users set pwd={0} where id={0}", pwd, userid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 判断当前密码
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static DataTable SelectOldPassWord(int userid)
        {
            string sql = string.Format(@"select pwd from users where id={0}", userid);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }

    }
}
