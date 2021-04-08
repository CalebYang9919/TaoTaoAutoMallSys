using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Models;

namespace DAL
{
    public class AdvertisingDAL
    {
        /// <summary>
        /// 查询广告
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectA()
        {
            string sql = string.Format("select top 5 * from advertisings where shows=1 order by id desc");
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 根据ID查询广告
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectById(int id)
        {
            string sql = string.Format("select * from advertisings where id={0}",id);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 删除广告
        /// </summary>
        /// <returns></returns>
        public static bool DeleteAd(int id)
        {
            string sql = string.Format("delete advertisings where id={0}",id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 添加广告
        /// </summary>
        /// <returns></returns>
        public static bool AddAd(AdvertisingInfo ad)
        {
            string sql = string.Format("insert into advertisings values('{0}','{1}',{2},{3})",ad.name,ad.urls,ad.classid,ad.shows);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 修改广告
        /// </summary>
        /// <returns></returns>
        public static bool UpdateAd(AdvertisingInfo ad)
        {
            string sql = string.Format("update advertisings set name='{0}',urls='{1}',classid={2},shows={3} where id={4}", ad.name, ad.urls,ad.classid, ad.shows, ad.id);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}
