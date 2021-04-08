using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL
{

    public class OrderDAL
    {

        /// <summary>
        /// 新增订单
        /// </summary>
        /// <param name="orderid">订单ID</param>
        /// <param name="uid">用户ID</param>
        /// <param name="contectid">收货地址ID</param>
        /// <returns>bool</returns>
        public static bool AddOrder(string orderid, string uid, string contectid)
        {
            string sql = string.Format("insert into orders (orderid,userid,contectid,ordertype) values('{0}','{1}','{2}','未支付')", orderid, uid, contectid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 新增订单详情
        /// </summary>
        /// <param name="orderid">订单ID</param>
        /// <param name="pid">用户ID</param>
        /// <param name="quantity">数量</param>
        /// <returns>bool</returns>
        public static bool AddOrderInfo(string orderid, string pid, string quantity)
        {
            string sql = string.Format("insert into orderinfo values('{0}','{1}','{2}')", orderid, pid, quantity);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 支付订单
        /// </summary>
        /// <param name="orderid">订单ID</param>
        /// <returns>bool</returns>
        public static bool Pay(string orderid)
        {
            string sql = string.Format("update orders set ordertype = '已支付' where orderid = '{0}'", orderid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 订单列表
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static DataTable SelectAllOrders(int userid)
        {
            string sql = string.Format(@"select t.orderid,t.name,t.mobile,t.ordertype,sum(t.productprice*t.quantity)
as productprice from(select d.quantity, a.orderid,b.name,b.mobile,a.ordertype,c.productprice from
orders a,contect b,product c,orderinfo d where a.userid=b.user_id and a.userid = {0} and c.id=d.productid and a.orderid=d.orderid and a.contectid=b.id) t
group by t.orderid,t.name,t.mobile,t.ordertype", userid);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }
        /// <summary>
        /// 订单详情1
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static DataTable SelectAllOrdersInfo(string orderid)
        {
            string sql = string.Format(@"select t.orderid,t.name,t.mobile,t.ordertype,t.address,sum(t.productprice*t.quantity)
as productprice from(select d.quantity, a.orderid, b.name, b.mobile, a.ordertype, c.productprice, b.address from
     orders a, contect b, product c, orderinfo d where a.userid = b.user_id and a.orderid= '{0}' and c.id = 
d.productid and a.orderid = d.orderid and a.contectid = b.id) t
group by t.orderid, t.name, t.mobile, t.ordertype, t.address
", orderid);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }

        /// <summary>
        /// 订单详情2
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static DataTable SelectAllOrdersInfo1(string orderid)
        {
            string sql = string.Format(@"select * from orderinfo a,product b where a.productid = b.id and a.orderid = '{0}'", orderid);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }

        /// <summary>
        /// 查询订单详情商品数量
        /// </summary>
        /// <param name="orderid">订单编号</param>
        /// <returns>List<ProductInfo></returns>
        public static List<ProductInfo> SelectOrderProductQuantity(string orderid)
        {
            string sql = string.Format("select * from orderinfo where orderid ='{0}'",orderid);
            List<ProductInfo> list = new List<ProductInfo>();
            DataTable dt = DBHelper.GetDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    ProductInfo pro = new ProductInfo();
                    //将dt行数据封装成对象
                    pro.Id = int.Parse(row["productid"].ToString());
                    pro.Quantity = int.Parse(row["quantity"].ToString());
                    //将对象加入到list中
                    list.Add(pro);
                }
            }
            return list;
        }


        /// <summary>
        /// 根据订单类型查询订单
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="ordertype"></param>
        /// <returns></returns>
        public static DataTable SelectAllOrdersByOrdertype(string uid,string ordertype) 
        {
            string sql = string.Format(@"select t.orderid,t.name,t.mobile,t.ordertype,sum(t.productprice*t.quantity)
as productprice from(select d.quantity, a.orderid,b.name,b.mobile,a.ordertype,c.productprice from
orders a,contect b,product c,orderinfo d where a.userid=b.user_id and a.userid = {0} and a.ordertype = '{1}' and c.id=d.productid and a.orderid=d.orderid and a.contectid=b.id) t
group by t.orderid,t.name,t.mobile,t.ordertype", uid, ordertype);
            DataTable dt = DBHelper.GetDataTable(sql);
            return dt;
        }


        public static DataTable SelectByTime(string uid)
        {
            string sql = string.Format("select * from orders where DateDiff(hh,time,getDate())>24 and ordertype = '未支付' and userid = {0}",uid);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 根据订单ID删除订单
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static bool DeleteOrdersByOrderID(string orderid)
        {
            string sql = string.Format("delete orders where orderid = '{0}'", orderid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 订单ID删除订单详情
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static bool DeleteOrderinfoByOrderID(string orderid)
        {
            string sql = string.Format("delete orderinfo where orderid = '{0}'", orderid);
            return DBHelper.ExecuteNonQuery(sql);
        }


        /// <summary>
        /// 查询未支付订单还有多长时间关闭
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static int SelectTime(string orderid)
        {
            string sql = string.Format("select 1440 - DateDiff(MINUTE,time,getDate()) time from orders where DateDiff(hh,time,getDate())<=24 and ordertype = '未支付' and orderid = '{0}'",orderid);
            return int.Parse(DBHelper.GetDataTable(sql).Rows[0]["time"].ToString());
        }

        /// <summary>
        /// 签收
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public static bool Qs(string orderid)
        {
            string sql = string.Format("Update orders set ordertype = '已签收' where orderid = '{0}'",orderid);
            return DBHelper.ExecuteNonQuery(sql);
        }



        /// <summary>
        /// 查询订单
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectOrder()
        {
            string sql = string.Format(@"select * from orders,contect,users where orders.contectid=contect.id and orders.userid=users.id");
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 分页查询订单
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable IndexOrders(int findex)
        {
            string sql = string.Format(@"select top {0} orders.orderid,user_name,name,orders.id,ordertype
from orders,contect,users where orders.contectid=
contect.id and orders.userid=users.id and orders.id not in (select top {1} orders.id from orders order by orders.id) 
order by orders.id", findex * 12, (findex - 1) * 12);
            return DBHelper.GetDataTable(sql);

        }

        /// <summary>
        /// 根据ID删除订单
        /// </summary>
        /// <returns></returns>
        public static bool DeleteOrderById(int id)
        {
            
            string sql = string.Format(@"delete orders where id={0}", id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 查出订单ID用来删除订单详情
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectOrderInfoByDele(int id)
        {
            string sql = string.Format(@"select * from orders where id={0}", id);
            return DBHelper.GetDataTable(sql);
        }


        /// <summary>
        /// 支付订单
        /// </summary>
        /// <returns></returns>
        public static bool UpdateOrders(int id)
        {
            string sql = string.Format(@"update orders set ordertype='已发货' where id={0}", id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 根据用户ID查询订单
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectByUserId(int userid)
        {
            string sql = string.Format(@"select * from orders where userid={0} and ordertype='已发货'", userid);
            return DBHelper.GetDataTable(sql);
        }

    }
}
