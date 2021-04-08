using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Text.RegularExpressions;

namespace Taotaonetwork
{
    public partial class ProductAdd : System.Web.UI.Page
    {
        public static int xuan;
        public static string imgurl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    List<ProductInfo> list = ProductBLL.SelectById(int.Parse(Request.QueryString["id"]));
                    TextBox1.Text = list[0].ProductName;
                    productid.Text = list[0].Id.ToString();
                    TextBox3.Text = list[0].Quantity.ToString(); 
                    TextBox4.Text = list[0].ProductPrice.ToString();
                    string urls = "~/images/2011/" + list[0].ProductPic;
                    Image1.ImageUrl = urls;
                    imgurl = list[0].ProductPic;
                }

                DropDownList1.DataSource = ProductListBLL.SelectProductList();
                DropDownList1.DataTextField = "classname";
                DropDownList1.DataValueField = "classid";
                DropDownList1.DataBind();
                xuan = int.Parse(DropDownList1.SelectedValue);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox3.Text == "" || TextBox4.Text == "")
            {
                Response.Write("<script>alert('请将信息填充完整！');</script>");
            }
            else
            {
                if (Regex.IsMatch(TextBox3.Text, @"^\d*[.]?\d*$") && Regex.IsMatch(TextBox4.Text, @"^\d*[.]?\d*$"))
                {
                    ProductInfo info = new ProductInfo();
                    info.ProductName = TextBox1.Text;
                    info.ProductPrice = int.Parse(TextBox3.Text);
                    info.Quantity = int.Parse(TextBox4.Text);
                    info.Hot = 0;
                    info.ClassId = xuan;
                    info.ProductPic = imgurl;
                    info.AddTime = DateTime.Now;
                    if (productid.Text != "")
                    {
                        info.Id = int.Parse(productid.Text);
                        if (ProductBLL.UpdateProducts(info))
                        {
                            Response.Write("<script>alert('修改成功！');window.location.href='ProductList.aspx'</script>");
                        }
                    }
                    else
                    {
                        if (ProductBLL.AddProducts(info))
                        {
                            Response.Write("<script>alert('添加成功！');window.location.href='ProductList.aspx'</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('单价或数量只能为数字！');</script>");
                }
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.FileName;
                string ge = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();
                string zi = DateTime.Now.ToString("yyyyMMddHHmmss") + new Random().Next(1, 10000) + filename;
                if (ge != "jpg" && ge != "png" && ge != "jpeg")
                {

                }
                else
                {
                    string path = Server.MapPath("~/");
                    FileUpload1.SaveAs(path + "images/2011/" + zi);
                    imgurl = zi;
                    Image1.ImageUrl = "~/images/2011/" + zi;
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            xuan = int.Parse(DropDownList1.SelectedValue);
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}