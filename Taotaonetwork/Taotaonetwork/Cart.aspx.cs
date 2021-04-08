using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Taotaonetwork
{
    public partial class Cart : System.Web.UI.Page
    {
        public bool show = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    show = CartBLL.SelectCartByUID(Session["uid"].ToString()).Rows.Count > 0;
                    this.Repeater1.DataSource = CartBLL.SelectCartByUID(Session["uid"].ToString());
                    this.Repeater1.DataBind();
                }
            }
        }

        //加入购物车
        [WebMethod]
        public static bool AddCart(string uid, string pid,string num)   //必须是公共的静态方法 static
        {
            return CartBLL.AddCart(uid, pid, num);
        }

        //修改购物车数量
        [WebMethod]
        public static bool UpdateNum(string num,string uid,string pid)   //必须是公共的静态方法 static
        {
            if (CartBLL.UpdataQuantity(uid,pid,int.Parse(num)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //删除购物车商品
        [WebMethod]
        public static bool Remove(string uid, string pid)   //必须是公共的静态方法 static
        {
            if (CartBLL.Remove(uid,pid))
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        //清空购物车
        [WebMethod]
        public static bool RemoveAll(string uid)   //必须是公共的静态方法 static
        {
            if (CartBLL.RemoveAll(uid))
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
    }
}