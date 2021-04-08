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
    public partial class UserInfo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    this.TextBox1.Text = Session["username"].ToString();
                    List<User> user = UserBLL.SelectUserInfo(this.TextBox1.Text);
                    //加载信息
                    this.TextBox2.Text = user[0].email;
                    this.TextBox3.Text = user[0].mobile;
                    this.Image1.ImageUrl = "~/UploadPic/" + user[0].UserImg;//加载图片
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //实例化对象
            User use = new Models.User();
            use.user_name = this.TextBox1.Text.Trim();
            use.email = this.TextBox2.Text.Trim();
            use.mobile = this.TextBox3.Text.Trim();
            //判断是否有待上传的文件
            if (this.FileUpload1.HasFile)
            {
                //获取上传文件的文件名
                string fileName = FileUpload1.FileName;
                //获取文件的后缀名
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                if (fileFix != "png" && fileFix != "jpg" && fileFix != "jpeg" && fileFix != "gif")
                {
                    Response.Write("上传的文件不是图片类型的文件");
                }
                else
                {
                    //获取项目的根目录
                    string path = Server.MapPath(".");
                    string newFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + new Random().Next(1, 100000000) + fileName;
                    //调用SaveAs上传
                    FileUpload1.SaveAs(path + "/UploadPic/" + newFileName);
                    //将上传的图片显示到Image控件中显示
                    this.Image1.ImageUrl = "~/UploadPic/" + newFileName;
                    //更改文件名
                    use.UserImg = newFileName;
                }
            }
            //根据BLL层返回结果判断是否修改成功
            if (UserBLL.UpdateUserInfo(use.user_name, use.email, use.mobile, use.UserImg))
            {
                //跳转到主界面
                //Response.Redirect("index.aspx");

                Response.Write("<script>alert('修改成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_Disposed(object sender, EventArgs e)
        {
            this.TextBox1.Text = Session["username"].ToString();
            List<User> user = UserBLL.SelectUserInfo(this.TextBox1.Text);
            this.Image1.ImageUrl = "~/UploadPic/" + user[0].UserImg;//加载图片
        }
    }
}
