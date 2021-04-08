using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Web.Services;

namespace Taotaonetwork.Admin
{
    public partial class OrdersList : System.Web.UI.Page
    {
        public static string anone = "none";
        public static string ainline = "inline";
        public static int pageindex = 0;
        public static int indexs;

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["indexx"] != null)
            {
                Repeater1.DataSource = OrderBLL.IndexOrders(int.Parse(Request.QueryString["indexx"].ToString()));
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = OrderBLL.IndexOrders(1);
                Repeater1.DataBind();
            }
            //Repeater1.DataSource = ProductBLL.SelectProducts();
            //Repeater1.DataBind();
            int shu = OrderBLL.SelectOrder().Rows.Count;
            if (shu % 12 == 0)
            {
                pageindex = shu / 12;
            }
            else
            {
                pageindex = shu / 12 + 1;
            }
        }

        /// <summary>
        /// ajax删除订单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static string deletes(string id)
        {

            if (OrderBLL.DeleteOrderById(int.Parse(id)))
            {
                return "删除成功";
            }
            else
            {
                return "删除失败";
            }

        }

        /// <summary>
        /// ajax发货
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static string pays(string id)
        {

            if (OrderBLL.UpdateOrders(int.Parse(id)))
            {
                return "发货成功";
            }
            else
            {
                return "发货失败";
            }

        }

        /// <summary>
        /// 点击数字的时候分页
        /// </summary>
        /// <param name="shu"></param>
        /// <returns></returns>
        [WebMethod]
        public static int dd(int shu)
        {
            if (shu <= pageindex)
            {
                indexs = shu;
            }
            else
            {
                indexs = pageindex;
            }
            return indexs;
        }

        /// <summary>
        /// 加页码
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int sh()
        {
            indexs++;
            if (indexs <= pageindex)
            {
                return indexs;
            }
            else
            {
                indexs = pageindex;
                return indexs;
            }
        }

        /// <summary>
        /// 减页码
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int jian()
        {
            indexs--;
            if (indexs > 0)
            {
                return indexs;
            }
            else
            {
                indexs = 1;
                return indexs;
            }

        }

    }
}