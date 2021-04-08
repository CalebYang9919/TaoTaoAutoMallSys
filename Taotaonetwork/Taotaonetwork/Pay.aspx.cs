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
    public partial class Pay : System.Web.UI.Page
    {



        public string strIds = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            strIds = Request.QueryString["strIds"];
            string[] strArray = strIds.Split(',');
            this.Repeater1.DataSource = PayBLL.SelectCartByPID(Session["uid"].ToString(), strArray);
            this.Repeater1.DataBind();
            this.Repeater2.DataSource = ContectBLL.SelectByUID(Session["uid"].ToString());
            this.Repeater2.DataBind();
        }

        [WebMethod]
        public static bool Update(string cid, string province,string city, string area,string town, string xxdz,string name, string mobile)   //必须是公共的静态方法 static
        {
            return ContectBLL.UpdateByID(cid, province, city, area, town, xxdz, name, mobile);
        }

        [WebMethod]
        public static bool Add(string province, string city, string area, string town, string xxdz, string name, string mobile , string uid)   //必须是公共的静态方法 static
        {
            return ContectBLL.Add(province, city, area, town, xxdz, name, mobile,uid);
        }
    }
}