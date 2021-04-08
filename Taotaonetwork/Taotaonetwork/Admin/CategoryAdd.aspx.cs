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
    public partial class CategoryAdd : System.Web.UI.Page
    {
        public static string imgurl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["classid"] != null)
                {
                    List<ProductListInfo> list = ProductListBLL.SelectById(int.Parse(Request.QueryString["classid"]));
                    TextBox1.Text = list[0].ClassName;
                    TextBox2.Text = list[0].ClassID.ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                if (TextBox2.Text != "")
                {
                    ProductListInfo info = new ProductListInfo();
                    info.ClassName = TextBox1.Text;
                    info.ClassID = int.Parse(TextBox2.Text);
                    if (ProductListBLL.UpdateById(info))
                    {
                        Response.Write("<script>alert('修改成功！');window.location.href='CategoryList.aspx';</script>");
                    }
                }
                else
                {

                    if (ProductListBLL.AddProductList(TextBox1.Text))
                    {
                        Response.Write("<script>alert('添加成功！');window.location.href='CategoryList.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('添加失败！');</script>");
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('请将需要添加的字段补充完整！');</script>");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    string ge = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();
                    string zi = TextBox1.Text+".png";
                    if (ge != "png")
                    {
                    }
                    else
                    {
                        string path = Server.MapPath("~/");
                        FileUpload1.SaveAs(path + "images/Image/" + zi);
                        imgurl = zi;
                        Image1.ImageUrl = "~/images/Image/" + zi;
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('请将需要添加的字段补充完整！');</script>");
            }
        }

    }
}