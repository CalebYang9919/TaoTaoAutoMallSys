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
    public partial class LiJiPayment : System.Web.UI.Page
    {
        public static string orderid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string pid = Request.QueryString["pid"];
            string num = Request.QueryString["num"];
            string cid = Request.QueryString["cid"];
            string price = Request.QueryString["price"];
            this.Label1.Text = price;
            orderid = OrderBLL.AddOrderTo(Session["uid"].ToString(), pid, cid, num);
        }

        [WebMethod]
        public static bool Pay(String uid, string price)
        {
            return OrderBLL.Pay(orderid, uid, price);
        }
    }
}