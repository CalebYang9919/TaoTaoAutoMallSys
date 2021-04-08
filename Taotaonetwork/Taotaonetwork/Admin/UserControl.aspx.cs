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
    public partial class UserControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = ContectBLL.selectcontect();
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            bool result = ContectBLL.deleteById(int.Parse(e.CommandArgument.ToString()));
            Repeater1.DataSource = ContectBLL.selectcontect();
            Repeater1.DataBind();
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static bool deletes(string id)
        {
            return ContectBLL.deleteById(int.Parse(id));
        }
    }
}