using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    public class PayBLL
    {
        /// <summary>
        /// 查询购物车商品
        /// </summary>
        /// <param name="uid">用户ID</param>
        /// <param name="strIds">商品ID数组</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectCartByPID(string uid, string[] strIds)
        {
            return PayDAL.SelectCartByPID(uid,strIds);
        }
    }
}
