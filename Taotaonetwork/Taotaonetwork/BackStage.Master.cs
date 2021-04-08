using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Web.Services;


namespace Taotaonetwork
{
    public partial class BackStage : System.Web.UI.MasterPage
    {
        public static string[] shu=new string[5];
        public static int[] zi = new int[5];
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 5; i++)
            {
                shu[i] = i.ToString();
                zi[i] = 1;
            }

            for (int i = 0; i < ProductBLL.SelectTongJi().Rows.Count; i++)
            {
                shu[i] = ProductBLL.SelectById(int.Parse(ProductBLL.SelectTongJi().Rows[i]["productid"].ToString()))[0].ProductName;
                zi[i] = int.Parse(ProductBLL.SelectTongJi().Rows[i]["shu"].ToString());
            }
            Repeater1.DataSource = ProductBLL.SelectXiao();
            Repeater1.DataBind();
            
        }

        /// <summary>
        /// 统计
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static string statistics(string id)
        {
            shu[0] = "可以";
            ProductBLL.SelectTongJi();
            string[] name = new string[ProductBLL.SelectTongJi().Rows.Count];
            return "删除失败";
        }
    }
}