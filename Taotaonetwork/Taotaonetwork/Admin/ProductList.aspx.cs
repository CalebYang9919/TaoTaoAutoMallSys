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
    public partial class ProductList : System.Web.UI.Page
    {
        public static int pageindex = 0;
        public static int indexs;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["indexx"] != null)
                {
                    Repeater1.DataSource = ProductBLL.IndexProducts(int.Parse(Request.QueryString["indexx"].ToString()));
                    Repeater1.DataBind();
                }
                else
                {
                    Repeater1.DataSource = ProductBLL.IndexProducts(1);
                    Repeater1.DataBind();
                }
                //Repeater1.DataSource = ProductBLL.SelectProducts();
                //Repeater1.DataBind();
                int shu = ProductBLL.SelectProducts().Rows.Count;
                if (shu % 12 == 0)
                {
                    pageindex = shu / 12;
                }
                else
                {
                    pageindex = shu / 12 + 1;
                }
            }
        }

        //删除商品
        [WebMethod]
        public static bool deletes(string id)
        {
            return ProductBLL.DeleteProducts(int.Parse(id));
        }

        /// <summary>
        /// 点击数字的时候分页
        /// </summary>
        /// <param name="shu"></param>
        /// <returns></returns>
        [WebMethod]
        public static int dd(int shu)
        {
            if (shu <= pageindex)
            {
                indexs = shu;
            }
            else
            {
                indexs = pageindex;
            }
            return indexs;
        }

        /// <summary>
        /// 加页码
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int sh()
        {
            indexs++;
            if (indexs <= pageindex)
            {
                return indexs;
            }
            else
            {
                indexs = pageindex;
                return indexs;
            }
        }

        /// <summary>
        /// 减页码
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int jian()
        {
            indexs--;
            if (indexs>0)
            {
                return indexs;
            }
            else
            {
                indexs = 1;
                return indexs;
            }

        }
       
    }
}