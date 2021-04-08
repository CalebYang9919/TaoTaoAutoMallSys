using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Taotaonetwork
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        /// <summary>
        /// 获取商品一级分类
        /// </summary>
        void ShowProductList()
        {
            this.Repeater3.DataSource = ProductListBLL.SelectProductList();
            this.Repeater3.DataBind();
        }
        /// <summary>
        /// 获取新品展示列表
        /// </summary>
        void BindNewProductList()
        {
            this.Repeater1.DataSource = ProductBLL.SelectNewProduct();
            this.Repeater1.DataBind();
        }
        /// <summary>
        /// 获取热门商品列表
        /// </summary>
        void BindHotProductList()
        {
            this.Repeater2.DataSource = ProductBLL.SelectHotProduct();
            this.Repeater2.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            BindHotProductList();  //获取热卖展示列表
            BindNewProductList();  //显示新品展示列表
            ShowProductList();     //获取商品分类
            Repeater4.DataSource = AdvertisingBLL.SelectA();
            Repeater4.DataBind();
        }
    }
}