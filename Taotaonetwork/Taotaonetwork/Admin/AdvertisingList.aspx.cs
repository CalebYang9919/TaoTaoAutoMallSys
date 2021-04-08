using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Web.Services;

namespace Taotaonetwork.Admin
{
    public partial class AdvertisingList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataSource = AdvertisingBLL.SelectA();
                    Repeater1.DataBind();
            }

        }

        /// <summary>
        /// 根据Id删除广告
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static string deletes(string id)
        {
            if (AdvertisingBLL.DeleteAd(int.Parse(id)))
            {
                return "删除成功";
            }
            else
            {
                return "删除失败";
            }

        }
    }
}