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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "")
            {
                User user = new User();
                user.user_name = TextBox1.Text;
                user.pwd = TextBox2.Text;
                if (LoginBLL.Logins(user))
                {
                    Session["username"] = user.user_name;
                    List<User> list = LoginBLL.Loginss(user);
                    int ss = list[0].id;
                    int dd = user.id;
                    Session["uid"] = dd;
                    Response.Write("<script>alert('登录成功！');</script>");
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('登录失败，用户名或密码错误！');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('用户名和密码不能为空！');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}