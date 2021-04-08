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
    public partial class Payment : System.Web.UI.Page
    {
        public string price = "";
        public static string orderid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            price = Request.QueryString["price"];
            string strIds = Request.QueryString["strIds"];
            string cid = Request.QueryString["cid"];
            string[] strArray = strIds.Split(',');
            orderid = OrderBLL.AddOrder(Session["uid"].ToString(), strArray, cid);
        }

        [WebMethod]
        public static bool Pay(String uid,string price) 
        {
            return OrderBLL.Pay(orderid,uid,price);
        }
    }
}