using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BLL;
using Models;
using System.Data;

namespace Taotaonetwork
{
    public partial class LiJiPay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string pid = Request.QueryString["pid"];
            string num = Request.QueryString["num"];
            Session["num"] = num;
            Session["pid"] = pid;
            List<ProductInfo> list = ProductBLL.SelectById(int.Parse(pid));
            list[0].Quantity = int.Parse(num);
            this.Repeater1.DataSource = list;
            this.Repeater1.DataBind();
            this.Repeater2.DataSource = ContectBLL.SelectByUID(Session["uid"].ToString());
            this.Repeater2.DataBind();
        }
    }
}