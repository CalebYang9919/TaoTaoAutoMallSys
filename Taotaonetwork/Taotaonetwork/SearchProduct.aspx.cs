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
    public partial class SearchProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Request.QueryString["name"];
            if (name != "")
            {
                this.RepeaterSearch.DataSource = ProductBLL.ShowSearch(name);
            }
            this.LinkButton1.Text = ProductBLL.SelectClassNameByProductName(name)+"?";
            this.Label1.Text = name;
            Session["show"] = ProductBLL.ShowSearch(name).Count>0;
            this.RepeaterSearch.DataBind();
        }


    }
}