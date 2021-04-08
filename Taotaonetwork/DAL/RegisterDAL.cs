using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RegisterDAL
    {
        public static bool Register(String username, string pwd, string email, string mobile)
        {
            string sql = string.Format("insert into users values('{0}','{1}','{2}','{3}','{4}','{5}')", username, pwd, email, mobile, 1, "user.jpg");
            bool zhu = DBHelper.ExecuteNonQuery(sql);
            string SqlSelectId = string.Format("select * from users where user_name='{0}' and pwd='{1}'", username, pwd);
            int uid = int.Parse(DBHelper.GetDataTable(SqlSelectId).Rows[0]["id"].ToString());
            string SqlAdd = string.Format("insert into wallets values({0},{1})", uid, 0);
            return DBHelper.ExecuteNonQuery(SqlAdd);

        }

        public static bool SelectByUserName(String username)
        {
            string sql = string.Format("select * from users where user_name = '{0}'", username);
            return DBHelper.GetDataTable(sql).Rows.Count > 0;
        }
    }
}
