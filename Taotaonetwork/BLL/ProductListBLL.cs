using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Models;

namespace BLL
{
    public class ProductListBLL
    {
        /// <summary>
        /// 查看商品分类
        /// </summary>
        /// <returns></returns>
        public static List<ProductListInfo> SelectProductList()
        {
            return ProductListDAL.SelectProductList();
        }

        /// <summary>
        /// 添加分类
        /// </summary>
        /// <returns></returns>
        public static bool AddProductList(string classname)
        {
            return ProductListDAL.AddProductList(classname);
        }

        /// <summary>
        /// 根据ID删除分类
        /// </summary>
        /// <returns></returns>
        public static bool DeleteById(int classid)
        {
            if (ProductDAL.SelectByClassId(classid).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return ProductListDAL.DeleteById(classid);
            }

        }

        /// <summary>
        /// 根据ID查询分类
        /// </summary>
        /// <returns></returns>
        public static List<ProductListInfo> SelectById(int classid)
        {
            return ProductListDAL.SelectById(classid);
        }

        /// <summary>
        /// 根据ID修改分类
        /// </summary>
        /// <returns></returns>
        public static bool UpdateById(ProductListInfo info)
        {
            return ProductListDAL.UpdateById(info);
        }
    }
}
