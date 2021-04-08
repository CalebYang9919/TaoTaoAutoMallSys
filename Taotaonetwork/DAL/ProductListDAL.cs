using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ProductListDAL
    {
        /// <summary>
        /// 查询分类商品信息
        /// </summary>
        /// <returns></returns>
        public static List<ProductListInfo> SelectProductList()
        {
            string sql = string.Format("select * from productlist");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductListInfo> list = new List<ProductListInfo>();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    ProductListInfo pro = new ProductListInfo();
                    //将dt行数据封装成对象
                    pro.ClassID = int.Parse(row["classid"].ToString());
                    pro.ClassName = row["classname"].ToString();
                    //将对象加入到list中
                    list.Add(pro);
                }
            }
            return list;
        }

        /// <summary>
        /// 添加分类
        /// </summary>
        /// <returns></returns>
        public static bool AddProductList(string classname)
        {
            string sql = string.Format("insert into productlist values('{0}')", classname);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 根据ID删除分类
        /// </summary>
        /// <returns></returns>
        public static bool DeleteById(int classid)
        {
            string sql = string.Format("delete productlist where classid={0}", classid);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 根据ID查询分类
        /// </summary>
        /// <returns></returns>
        public static List<ProductListInfo> SelectById(int classid)
        {
            string sql = string.Format("select * from productlist where classid={0}", classid);
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductListInfo> list = new List<ProductListInfo>();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    ProductListInfo pro = new ProductListInfo();
                    //将dt行数据封装成对象
                    pro.ClassID = int.Parse(row["classid"].ToString());
                    pro.ClassName = row["classname"].ToString();
                    //将对象加入到list中
                    list.Add(pro);
                }
            }
            return list;
        }

        /// <summary>
        /// 根据ID修改分类
        /// </summary>
        /// <returns></returns>
        public static bool UpdateById(ProductListInfo info)
        {
            string sql = string.Format("update productlist set classname='{0}' where classid={1}", info.ClassName, info.ClassID);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}
