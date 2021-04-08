using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Services;

namespace Taotaonetwork
{
    public partial class MyOrders : System.Web.UI.Page
    {

        public bool showa = false;
        public bool showb = false;
        public bool showc = false;
        public bool showd = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (OrderBLL.SelectAllOrders(int.Parse(Session["uid"].ToString())).Rows.Count == 0)
            {
                showa = true;
            }
            if (OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "未支付").Rows.Count == 0)
            {
                showb = true;
            }
            if (OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "已支付").Rows.Count == 0)
            {
                showc = true;
            }
            if (OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "已发货").Rows.Count == 0)
            {
                showd = true;
            }
            this.Repeater1.DataSource = OrderBLL.SelectAllOrders(int.Parse(Session["uid"].ToString()));
            this.Repeater1.DataBind();
            this.Repeater2.DataSource = OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "未支付");
            this.Repeater2.DataBind();
            this.Repeater3.DataSource = OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "已支付");
            this.Repeater3.DataBind();
            this.Repeater4.DataSource = OrderBLL.SelectAllOrdersByOrdertype(Session["uid"].ToString(), "已发货");
            this.Repeater4.DataBind();
        }

        [WebMethod]
        public static bool Qs(string orderid)
        {
            return OrderBLL.Qs(orderid);
        }
    }
}