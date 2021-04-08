using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CartDAL
    {
        /// <summary>
        /// 加入购物车
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <param name="quantity">数量</param>
        /// <returns>bool</returns>
        public static bool AddCart(string uid, string pid, string quantity)
        {
            string sql = string.Format("insert into Cart values('{0}','{1}','{2}')", uid, pid, quantity);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 查询购物车该商品数量
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <returns>int</returns>
        public static int SelectProductQuantity(string uid, string pid)
        {
            string sql = string.Format("select quantity from Cart where productid={0} and userid = {1}", pid, uid);
            return int.Parse(DBHelper.GetDataTable(sql).Rows[0][0].ToString());
        }

        /// <summary>
        /// 查询购物车是否有该商品
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <returns>bool</returns>
        public static bool SelectProduct(string uid, string pid)
        {
            string sql = string.Format("select * from Cart where productid={0} and userid = {1}", pid, uid);
            return DBHelper.GetDataTable(sql).Rows.Count > 0;
        }

        /// <summary>
        /// 查询购物车所有商品
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectCartByUID(string uid)
        {
            string sql = string.Format("select a.productid,a.quantity,b.productname,b.productprice,b.productpic  from Cart a,product b where a.productid = b.id and a.userid = {0} ",uid);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 修改购物车商品数量
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <param name="quantity">商品数量</param>
        /// <returns>bool</returns>
        public static bool UpdataQuantity(string uid, string pid, int unm)
        {
            string sql = string.Format("update Cart set quantity = {0} where productid={1} and userid = {2}", unm, pid, uid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 购物车删除商品
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <returns>bool</returns>
        public static bool Remove(string uid,string pid)
        {
            string sql = string.Format("delete from cart where userid = {0}  and productid = {1}",uid,pid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 清空购物车
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <returns>bool</returns>
        public static bool RemoveAll(string uid)
        {
            string sql = string.Format("delete from cart where userid = {0}",uid);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}
