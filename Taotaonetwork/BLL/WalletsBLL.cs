using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Models;

namespace BLL
{
    public class WalletsBLL
    {
        /// <summary>
        /// 根据用户ID查询钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static List<WalletsInfo> SelectWallets(int userid)
        {
            return WalletsDAL.SelectWallets(userid);
        }

        /// <summary>
        /// 根据用户充值钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool UpdateWallets(WalletsInfo wa)
        {
                wa.amount=wa.amount+WalletsDAL.SelectWallets(wa.userid)[0].amount;
                return WalletsDAL.UpdateWallets(wa);
        }

         /// <summary>
        /// 添加用户充值钱包
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool AddWallets(WalletsInfo wa)
        {
            return WalletsDAL.AddWallets(wa);
        }
    }
}
