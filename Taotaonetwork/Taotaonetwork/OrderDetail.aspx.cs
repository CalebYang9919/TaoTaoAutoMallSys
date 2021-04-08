using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Taotaonetwork
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        public bool show = false;
        public int s = 0;
        public int m = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderid = Request.QueryString["orderid"];
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (OrderBLL.SelectAllOrdersInfo(orderid).Rows[0]["ordertype"].ToString() == "未支付")
            {
                int time = OrderBLL.SelectTime(orderid);
                s = time / 60;
                m = time % 60;
                this.Label1.Text = s.ToString();
                this.Label2.Text = m.ToString();
                show = true;
            }
            if (!IsPostBack)
            {
                
                this.Repeater1.DataSource = OrderBLL.SelectAllOrdersInfo(orderid);
                this.Repeater1.DataBind();
                this.Repeater2.DataSource = OrderBLL.SelectAllOrdersInfo1(orderid);
                this.Repeater2.DataBind();
            }
        }
    }
}