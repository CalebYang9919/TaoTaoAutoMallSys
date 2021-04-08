using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using BLL;

namespace Taotaonetwork
{
    public partial class ChangePassWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.TextBox1.Text.Trim() != "" && this.TextBox2.Text.Trim() != "" && this.TextBox3.Text.Trim() != "")
            {
                string OldPassWord = UserBLL.SelectOldPassWord(int.Parse(Session["uid"].ToString())).Rows[0]["pwd"].ToString();
                if (this.TextBox1.Text.Trim() == OldPassWord)
                {
                    if (this.TextBox2.Text.Trim() == this.TextBox3.Text.Trim())
                    {
                        UserBLL.UpdatePassWord(this.TextBox2.Text.Trim(), int.Parse(Session["uid"].ToString()));
                        Response.Write("<script>alert('密码修改成功');location.href='index.aspx';</script>");
                    }   
                    else
                    {
                        Response.Write("<script>alert('两次输入密码不一致！');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('当前密码不正确！');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('当前密码和新密码不能为空！');</script>");
            }
        }
    }
}