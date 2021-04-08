using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DAL;
using Models;

namespace BLL
{

    public class ProductBLL
    {
        public static List<ProductInfo> SelectProductByClassID(int classid)
        {
            return ProductDAL.SelectProductByClassID(classid);
        }
        /// <summary>
        /// 查询热卖商品
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectHotProduct()
        {
            return ProductDAL.SelectHotProduct();
        }
        /// <summary>
        /// 查询所有热卖商品
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectHotProductAll()
        {
            return ProductDAL.SelectHotProductAll();
        }
        /// <summary>
        /// 查询新上架商品
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectNewProduct()
        {
            return ProductDAL.SelectNewProduct();
        }

        /// <summary>
        /// 查询所有新商品
        /// </summary>
        /// <returns>DataTable</returns>
        public static List<ProductInfo> SelectNewProductAll()
        {
            return ProductDAL.SelectNewProductAll();
        }

        /// <summary>
        /// 搜索功能
        /// </summary>
        /// <param name="name">用户输入的搜索字段</param>
        /// <returns></returns>
        public static List<ProductInfo> ShowSearch(string name)
        {
            return ProductDAL.ShowSearch(name);
        }

        /// <summary>
        /// 根据商品名查出商品类别
        /// </summary>
        /// <param name="productname">string</param>
        /// <returns>string</returns>
        public static string SelectClassNameByProductName(string productname)
        {
            return ProductDAL.SelectClassNameByProductName(productname);
        }

        /// <summary>
        /// 商品详情页查询
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static List<ProductInfo> SelectById(int productid)
        {
            return ProductDAL.SelectById(productid);
        }


        /// <summary>
        /// 查询商品
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectProducts()
        {
            return ProductDAL.SelectProducts();
        }

        /// <summary>
        /// 分页查询商品
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable IndexProducts(int findex)
        {
            return ProductDAL.IndexProducts(findex);
        }

        /// <summary>
        /// 添加商品
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static bool AddProducts(ProductInfo info)
        {
            return ProductDAL.AddProducts(info);
        }

        /// <summary>
        /// 根据ID删除商品
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static bool DeleteProducts(int id)
        {
            if (ProductDAL.SelectOrderByProductidId(id).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return ProductDAL.DeleteProducts(id);
            }

        }

        /// <summary>
        /// 修改商品
        /// </summary>
        /// <returns></returns>
        public static bool UpdateProducts(ProductInfo info)
        {
            return ProductDAL.UpdateProducts(info);
        }

        ///// <summary>
        ///// 商品详情页查询
        ///// </summary>
        ///// <param name="productid"></param>
        ///// <returns></returns>
        //public static List<ProductInfo> SelectById(int productid)
        //{
        //    return ProductDAL.SelectById(productid);
        //}

        /// <summary>
        /// 统计
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectTongJi()
        {
            DataTable dt = ProductDAL.SelectXiao();
            return dt;
        }

        /// <summary>
        /// 商品销量排名
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectXiao()
        {
            DataTable dt = ProductDAL.SelectXiao();
            List<ProductInfo> list = new List<ProductInfo>();
            List<ProductInfo> lists = new List<ProductInfo>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ProductInfo pro = new ProductInfo();
                    pro.Id = int.Parse(dr["productid"].ToString());
                    list.Add(pro);
                }
            }
            if (list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    ProductInfo pro = new ProductInfo();
                    pro.Id = ProductDAL.SelectById(list[i].Id)[0].Id;
                    pro.ProductName = ProductDAL.SelectById(list[i].Id)[0].ProductName;
                    pro.Quantity = ProductDAL.SelectById(list[i].Id)[0].Quantity;
                    pro.ProductPic = ProductDAL.SelectById(list[i].Id)[0].ProductPic;
                    lists.Add(pro);
                }
            }

            return lists;
        }

                /// <summary>
        /// 前台商场查询所有商品
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable SelectProductAll()
        {
            return ProductDAL.SelectProductAll();
        }

    }
}
