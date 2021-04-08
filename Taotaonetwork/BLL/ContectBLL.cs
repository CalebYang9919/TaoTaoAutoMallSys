using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ContectBLL
    {
        /// <summary>
        /// 查询收货地址
        /// </summary>
        /// <param name="uid">用户ID</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectByUID(string uid)
        {
            return ContectDAL.SelectByUID(uid);
        }

        /// <summary>
        /// 修改收货地址
        /// </summary>
        /// <returns>BOOL</returns>
        public static bool UpdateByID(string cid, string province, string city, string area, string town, string xxdz, string name, string mobile)
        {
            return ContectDAL.UpdateByID(cid, province, city, area, town, xxdz, name, mobile);
        }

        /// <summary>
        /// 添加收货地址
        /// </summary>
        /// <returns>BOOL</returns>
        public static bool Add(string province, string city, string area, string town, string xxdz, string name, string mobile, string userid)
        {
            return ContectDAL.Add(province, city, area, town, xxdz, name, mobile, userid);
        }

        public static DataTable selectcontect()
        {
            return ContectDAL.selectcontect();
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static bool deleteById(int userid)
        {
            //查询该用户是否有订单未签收
            if (OrderDAL.SelectByUserId(userid).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return ContectDAL.deleteById(userid);
            }

        }

    }
}
