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
    public partial class CategoryList : System.Web.UI.Page
    {
        public int shu = 5;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Repeater1.DataSource = ProductListBLL.SelectProductList(); 
                Repeater1.DataBind();
            }
            
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            if (e.CommandName == "del")
            {
                if (ProductListBLL.DeleteById(int.Parse(e.CommandArgument.ToString())))
                {
                    Response.Write("<script>alert('删除成功！');</script>");
                    Repeater1.DataSource = ProductListBLL.SelectProductList();
                    Repeater1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }
                

            }
            if (e.CommandName == "editer")
            {
                Response.Write("<script>alert('点击编辑！');</script>");
            }
            
        }


        /// <summary>
        /// 删除商品分类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static bool deletes(string id)
        {
            return ProductListBLL.DeleteById(int.Parse(id));
        }

    }
}