using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BLL;

namespace Taotaonetwork
{
    public partial class QuPay : System.Web.UI.Page
    {
        public static string orderid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Label1.Text = Request.QueryString["price"];
            orderid = Request.QueryString["orderid"];
        }
        [WebMethod]
        public static bool Pay(String uid, string price)
        {
            return OrderBLL.Pay(orderid, uid, price);
        }
    }
}