using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class CommentsDAL
    {
        /// <summary>
        /// 实例化绑定数据
        /// </summary>
        /// <param name="list"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static List<CommentsInfo> huan(List<CommentsInfo> list, DataTable dt)
        {
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    CommentsInfo com = new CommentsInfo();
                    com.id = int.Parse(dr["id"].ToString());
                    com.user_id = int.Parse(dr["user_id"].ToString());
                    com.product_id = int.Parse(dr["product_id"].ToString());
                    com.contents = dr["contents"].ToString();
                    com.audit = int.Parse(dr["audit"].ToString());
                    com.stars = int.Parse(dr["stars"].ToString());
                    com.create_time = DateTime.Parse(dr["create_time"].ToString());
                    list.Add(com);
                }
            }
            return list;
        }

        /// <summary>
        /// 查询评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static DataTable SelectsComments(CommentsInfo com)
        {
            string sql = string.Format("select * from comments,users where comments.user_id=users.id and product_id={0}", com.product_id);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }

        /// <summary>
        /// 添加评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static bool AddComments(CommentsInfo com)
        {
            string sql = string.Format(@"insert into comments values('{0}','{1}','{2}','{3}','{4}','{5}')", com.user_id, com.product_id, com.contents, com.audit, com.stars, com.create_time);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 查询是否可以评论评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static DataTable SelectIs(CommentsInfo com)
        {
            string sql = string.Format("select * from orders,orderinfo where orders.orderid=orderinfo.orderid and productid={0} and userid={1} and ordertype='已签收' ", com.product_id, com.user_id);
            return DBHelper.GetDataTable(sql);
        }
    }
}
