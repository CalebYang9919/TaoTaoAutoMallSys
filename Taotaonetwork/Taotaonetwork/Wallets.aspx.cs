using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using BLL;
using System.Web.Services;


namespace Taotaonetwork
{
    public partial class Wallets : System.Web.UI.Page
    {
        public static int wid=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                int userid = int.Parse(Session["uid"].ToString());
                List<WalletsInfo> list = WalletsBLL.SelectWallets(userid);
                if (list.Count > 0)
                {
                    wid = list[0].id;
                    Label1.Text = "￥"+list[0].amount.ToString();
                }
                else
                {
                    Label1.Text = "0";
                }
               
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        [WebMethod]
        public static string ch(int ch, int userid)
        {
            
            WalletsInfo wa = new WalletsInfo();
            wa.amount = ch;
            wa.userid = userid;
            if (wid == 0)
            {
                if (WalletsBLL.AddWallets(wa))
                {
                    return "充值成功";
                }
                else
                {
                    return "充值失败";
                }
            }
            else
            {
                wa.id = wid;
                if (WalletsBLL.UpdateWallets(wa))
                {
                    return "充值成功";
                }
                else
                {
                    return "充值失败";
                }
            }
           
            
        }
    }
}