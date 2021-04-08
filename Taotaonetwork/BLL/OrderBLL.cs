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
    public class OrderBLL
    {

        public static DataTable SelectAllOrders(int userid)
        {
            return OrderDAL.SelectAllOrders(userid);
        }
        public static DataTable SelectAllOrdersInfo(string orderid)
        {
            return OrderDAL.SelectAllOrdersInfo(orderid);
        }
        public static DataTable SelectAllOrdersInfo1(string orderid)
        {
            return OrderDAL.SelectAllOrdersInfo1(orderid);
        }


        /// <summary>
        /// 新增订单
        /// </summary>
        /// <param name="uid">用户ID</param>
        /// <param name="strIds">商品ID数组</param>
        /// <param name="contectid">收获地址数组</param>
        /// <returns>string</returns>
        public static string AddOrder(string uid, string[] strIds, string contectid)
        {
            Random rand = new Random();
            int shu2 = rand.Next(1000, 9999);
            string orderid = DateTime.Now.ToString("yyyyMMddHHmmss") + shu2 + uid;
            if (OrderDAL.AddOrder(orderid, uid, contectid))
            {
                for (int i = 0; i < strIds.Length; i++)
                {
                    int quantity = CartDAL.SelectProductQuantity(uid, strIds[i]);
                    OrderDAL.AddOrderInfo(orderid, strIds[i], quantity.ToString());
                    CartDAL.Remove(uid, strIds[i]);
                }
                return orderid;
            }
            else
            {
                return orderid;
            }
        }

        public static string AddOrderTo(string uid, string pid, string cid, string num)
        {
            Random rand = new Random();
            int shu2 = rand.Next(1000, 9999);
            string orderid = DateTime.Now.ToString("yyyyMMddHHmmss") + shu2 + uid;
            OrderDAL.AddOrder(orderid, uid, cid);
            OrderDAL.AddOrderInfo(orderid, pid, num);
            return orderid;
        }

        /// <summary>
        /// 支付订单
        /// </summary>
        /// <param name="orderid"></param>
        /// <param name="uid"></param>
        /// <param name="price"></param>
        /// <returns></returns>
        public static bool Pay(string orderid,string uid,string price) 
        {
            List<WalletsInfo> list = WalletsBLL.SelectWallets(int.Parse(uid));
            if (int.Parse(list[0].amount.ToString())>=int.Parse(price))
            {
                OrderDAL.Pay(orderid);
                WalletsInfo wa = new WalletsInfo();
                wa.id = int.Parse(list[0].id.ToString());
                wa.userid = int.Parse(uid);
                wa.amount = 0 - int.Parse(price);
                WalletsBLL.UpdateWallets(wa);
                List<ProductInfo> listpro = OrderDAL.SelectOrderProductQuantity(orderid);
                foreach (var item in listpro)
                {
                    ProductDAL.UpdateQuantity(item.Id.ToString(), ProductDAL.SelectById(item.Id)[0].Quantity - item.Quantity);
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 根据订单类型查询订单
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="ordertype"></param>
        /// <returns></returns>
        public static DataTable SelectAllOrdersByOrdertype(string uid, string ordertype)
        {
            DataTable dt = OrderDAL.SelectByTime(uid);
            foreach (DataRow item in dt.Rows)
            {
                OrderDAL.DeleteOrderinfoByOrderID(item["orderid"].ToString());
                OrderDAL.DeleteOrdersByOrderID(item["orderid"].ToString());
            }

            return OrderDAL.SelectAllOrdersByOrdertype(uid, ordertype);
        }

        /// <summary>
        /// 查询未支付订单还有多长时间关闭
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static int SelectTime(string orderid)
        {
            return OrderDAL.SelectTime(orderid);
        }

        /// <summary>
        /// 签收
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static bool Qs(string orderid)
        {
            return OrderDAL.Qs(orderid);
        }



        /// <summary>
        /// 查询订单
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectOrder()
        {
            return OrderDAL.SelectOrder();
        }

        /// <summary>
        /// 分页查询订单
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable IndexOrders(int findex)
        {
            return OrderDAL.IndexOrders(findex);
        }

        /// <summary>
        /// 删除订单
        /// </summary>
        /// <returns></returns>
        public static bool DeleteOrderById(int id)
        {
            for (int i = 0; i < OrderDAL.SelectOrderInfoByDele(id).Rows.Count; i++)
            {
                OrderDAL.DeleteOrderinfoByOrderID(OrderDAL.SelectOrderInfoByDele(id).Rows[i]["orderid"].ToString());
            }
            return OrderDAL.DeleteOrderById(id);
        }

        /// <summary>
        /// 支付订单
        /// </summary>
        /// <returns></returns>
        public static bool UpdateOrders(int id)
        {
            return OrderDAL.UpdateOrders(id);
        }



    }
}
