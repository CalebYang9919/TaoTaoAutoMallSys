using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ContectDAL
    {
        /// <summary>
        /// 查询收货地址
        /// </summary>
        /// <param name="uid">用户ID</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectByUID(string uid) 
        {
            string sql = string.Format("select * from contect where user_id = {0}",uid);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 修改收货地址
        /// </summary>
        /// <returns>BOOL</returns>
        public static bool UpdateByID(string cid, string province, string city, string area, string town, string xxdz, string name, string mobile)
        {
            string sql = string.Format("update contect set name = '{0}',mobile='{1}',province='{2}',city='{3}',area='{4}',town='{5}',address='{6}' where id = {7}",name,mobile,province,city,area,town,xxdz,cid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 添加收货地址
        /// </summary>
        /// <returns>BOOL</returns>
        public static bool Add(string province, string city, string area, string town, string xxdz, string name, string mobile,string userid) 
        {
            string sql = string.Format("insert into contect (user_id,name,mobile,contact_flag,province,city,area,town ,address) values('{0}','{1}','{2}',0,'{3}','{4}','{5}','{6}','{7}')", userid, name, mobile, province, city, area, town, xxdz);
            return DBHelper.ExecuteNonQuery(sql);
        }

        public static DataTable selectcontect()
        {
            string sql = string.Format("select * from users where user_type=1");
            return DBHelper.GetDataTable(sql);
        }
        public static bool deleteById(int userid)
        {
            //删除该用户的订单
            string sqls = string.Format("delete orders where userid={0}", userid);
            //删除该用户
            string sql = string.Format("delete users where id={0}", userid);
            bool fan = DBHelper.ExecuteNonQuery(sqls);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}
