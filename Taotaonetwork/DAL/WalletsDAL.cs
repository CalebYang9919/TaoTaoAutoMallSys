using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Models;

namespace DAL
{
    public class WalletsDAL
    {
        /// <summary>
        /// 实例化绑定
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="list">实例化的商品</param>
        public static void DataNew(DataTable dt, List<WalletsInfo> list)
        {
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    WalletsInfo wi = new WalletsInfo();
                    //将dt行数据封装成对象
                    wi.id = int.Parse(row["id"].ToString());
                    wi.userid = int.Parse(row["userid"].ToString());
                    wi.amount = int.Parse(row["amount"].ToString());
                    //将对象加入到list中
                    list.Add(wi);
                }
            }
        }

        /// <summary>
        /// 根据用户ID查询钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static List<WalletsInfo> SelectWallets(int userid)
        {
            string sql = string.Format("select * from wallets where userid={0}",userid);
            DataTable dt = DBHelper.GetDataTable(sql);
            List<WalletsInfo> list = new List<WalletsInfo>();
            DataNew(dt, list);
            return list;
        
        }

        /// <summary>
        /// 根据用户充值钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool UpdateWallets(WalletsInfo wa)
        {
            string sql = string.Format("update wallets set amount={0} where id={1}", wa.amount,wa.id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 添加用户充值钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool AddWallets(WalletsInfo wa)
        {
            string sql = string.Format("insert into wallets values({0},{1})",wa.userid,wa.amount);
            return DBHelper.ExecuteNonQuery(sql);
        }


    }
}
