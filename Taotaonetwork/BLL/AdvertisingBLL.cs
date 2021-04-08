using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using System.Data.SqlClient;
using Models;

namespace BLL
{
    public class AdvertisingBLL
    {
        /// <summary>
        /// 查询广告
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectA()
        {
            return AdvertisingDAL.SelectA();
        }

        /// <summary>
        /// 根据ID查询广告
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectById(int id)
        {
            return AdvertisingDAL.SelectById(id);
        }

        /// <summary>
        /// 删除广告
        /// </summary>
        /// <returns></returns>
        public static bool DeleteAd(int id)
        {
            return AdvertisingDAL.DeleteAd(id);
        }

        /// <summary>
        /// 添加广告
        /// </summary>
        /// <returns></returns>
        public static bool AddAd(AdvertisingInfo ad)
        {
            return AdvertisingDAL.AddAd(ad);
        }

        /// <summary>
        /// 修改广告
        /// </summary>
        /// <returns></returns>
        public static bool UpdateAd(AdvertisingInfo ad)
        {
            return AdvertisingDAL.UpdateAd(ad);
        }
    }

     
}
