using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Data;

namespace Taotaonetwork.Admin
{
    public partial class AdvertisingAdd : System.Web.UI.Page
    {
        public static string imgurl;
        public static int xuan;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Request.QueryString["id"] != null)
                {
                    DataTable dt = AdvertisingBLL.SelectById(int.Parse(Request.QueryString["id"]));
                    TextBox1.Text = dt.Rows[0]["name"].ToString();
                    AdvertisingId.Text = dt.Rows[0]["id"].ToString();
                    string urls = "~/images/Image/" + dt.Rows[0]["urls"].ToString();
                    Image1.ImageUrl = urls;
                    imgurl = dt.Rows[0]["urls"].ToString();
                }
                DropDownList2.DataSource = ProductListBLL.SelectProductList();
                DropDownList2.DataTextField = "classname";
                DropDownList2.DataValueField = "classid";
                DropDownList2.DataBind();
                xuan = int.Parse(DropDownList1.SelectedValue);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || imgurl==null)
            {
                Response.Write("<script>alert('请将信息填充完整！');</script>");
            }
            else
            {
                AdvertisingInfo ad = new AdvertisingInfo();
                ad.name = TextBox1.Text;
                ad.shows = int.Parse(DropDownList1.SelectedValue);
                ad.urls = imgurl;
                ad.classid = xuan;
                if (AdvertisingId.Text != "")
                    {
                        ad.id = int.Parse(AdvertisingId.Text);
                        if (AdvertisingBLL.UpdateAd(ad))
                        {
                            Response.Write("<script>alert('修改成功！');window.location.href='AdvertisingList.aspx'</script>");
                        }
                    }
                    else
                    {
                        if (AdvertisingBLL.AddAd(ad))
                        {
                            Response.Write("<script>alert('添加成功！');window.location.href='AdvertisingList.aspx'</script>");
                        }
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
                    FileUpload1.SaveAs(path + "images/Image/" + zi);
                    imgurl = zi;
                    Image1.ImageUrl = "~/images/Image/" + zi;
                }
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            xuan = int.Parse(DropDownList1.SelectedValue);
        }
    }
}