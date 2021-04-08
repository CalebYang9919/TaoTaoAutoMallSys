using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    public class CartBLL
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
            if (CartDAL.SelectProduct(uid,pid))
            {
                int num = CartDAL.SelectProductQuantity(uid, pid) + int.Parse(quantity);
                return CartDAL.UpdataQuantity(uid, pid, num);
            }
            else
            {
                return CartDAL.AddCart(uid, pid, quantity);
            }
        }

        /// <summary>
        /// 查询购物车所有商品
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectCartByUID(string uid)
        {
            return CartDAL.SelectCartByUID(uid);
        }

        /// <summary>
        /// 修改购物车商品数量
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <param name="quantity">商品数量</param>
        /// <returns>bool</returns>
        public static bool UpdataQuantity(string uid, string pid, int quantity)
        {
            return CartDAL.UpdataQuantity(uid,pid,quantity);
        }

        /// <summary>
        /// 购物车删除商品
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <param name="pid">商品id</param>
        /// <returns>bool</returns>
        public static bool Remove(string uid, string pid)
        {
            return CartDAL.Remove(uid,pid);
        }

                /// <summary>
        /// 清空购物车
        /// </summary>
        /// <param name="uid">用户id</param>
        /// <returns>bool</returns>
        public static bool RemoveAll(string uid)
        {
            return CartDAL.RemoveAll(uid);
        }
    }
}
