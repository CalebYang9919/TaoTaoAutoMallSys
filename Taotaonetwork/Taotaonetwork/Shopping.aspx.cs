using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;

namespace Taotaonetwork
{
    public partial class Shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.RepeaterSearch.DataSource = ProductBLL.SelectProductAll();
            this.RepeaterSearch.DataBind();
            Session["show"] = ProductBLL.SelectProductAll().Rows.Count > 0;
            
        }
    }
}