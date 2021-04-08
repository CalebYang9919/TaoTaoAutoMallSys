using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TaotaonetworkUI.UserControls
{
    public partial class ProductList : System.Web.UI.UserControl
    {
        public int ProductClassID { get; set; }
        /// <summary>
        /// 获取指定分类下的商品列表
        /// </summary>
        void BindProductListByClassID()
        {
            this.DataList1.DataSource = ProductBLL.SelectProductByClassID(ProductClassID);
            this.DataList1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindProductListByClassID();   //绑定商品列表
            }
        }
    }
}