using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Web.Services;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Taotaonetwork
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["productid"] != null)
            {
                int shu = int.Parse(Request.QueryString["productid"]);
                Repeater1.DataSource = ProductBLL.SelectById(shu);
                Repeater1.DataBind();
                CommentsInfo com = new CommentsInfo();
                com.product_id = shu;
                Repeater2.DataSource = CommentsBLL.SelectsComments(com);
                Repeater2.DataBind();
            }
            else
            {
                Repeater1.DataSource = ProductBLL.SelectById(101);
                Repeater1.DataBind();
                CommentsInfo com = new CommentsInfo();
                com.product_id = 101;
                Repeater2.DataSource = CommentsBLL.SelectsComments(com);
                Repeater2.DataBind();
            }
        }

        /// <summary>
        /// 添加评论
        /// </summary>
        /// <param name="username"></param>
        /// <param name="paw"></param>
        /// <returns></returns>
        [WebMethod]
        public static bool AddComment(int userid, string productids, string contents, string stars)
        {
            CommentsInfo com = new CommentsInfo();
            com.user_id = userid;
            com.contents = contents;
            com.product_id = int.Parse(productids);
            com.audit = 0;
            com.stars = int.Parse(stars);
            com.create_time = DateTime.Now;
            return CommentsBLL.AddComments(com);

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            HtmlTableCell cell = null;
            cell = e.Item.FindControl("Label1") as HtmlTableCell;

            Label drv = (Label)e.Item.FindControl("Label1");
            string fan = "";
            for (int i = 0; i < int.Parse(drv.Text.ToString()); i++)
            {
                fan += "<i class='glyphicon glyphicon-star'></i>";
            }

            for (int i = 0; i < (5 - int.Parse(drv.Text.ToString())); i++)
            {
                fan += "<i class='glyphicon glyphicon-star-empty'></i>";
            }
            drv.Text = fan;
            //Response.Write(drv.Row.ItemArray[3].ToString() + fan);
            //}
        }
    }
}