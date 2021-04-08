using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Taotaonetwork
{
    public partial class NewShop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.RepeaterSearch.DataSource = ProductBLL.SelectNewProductAll();
            this.RepeaterSearch.DataBind();
            Session["show"] = ProductBLL.SelectNewProductAll().Count > 0;
        }
    }
}