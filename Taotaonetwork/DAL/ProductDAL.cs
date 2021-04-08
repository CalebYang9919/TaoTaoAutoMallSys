using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace DAL
{
    public class ProductDAL
    {
        /// <summary>
        /// 实例化绑定
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="list">实例化的商品</param>
        public static void DataNew(DataTable dt, List<ProductInfo> list)
        {
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    //实例化对象
                    ProductInfo pro = new ProductInfo();
                    //将dt行数据封装成对象
                    pro.Id = int.Parse(row["id"].ToString());
                    pro.ProductName = row["productname"].ToString();
                    pro.ClassId = int.Parse(row["classid"].ToString());
                    pro.ProductPrice = float.Parse(row["productprice"].ToString());
                    pro.Quantity = int.Parse(row["quantity"].ToString());
                    pro.Hot = int.Parse(row["hot"].ToString());
                    pro.ProductPic = row["productpic"].ToString();
                    pro.AddTime = DateTime.Parse(row["addtime"].ToString());
                    //将对象加入到list中
                    list.Add(pro);
                }
            }
        }
        /// <summary>
        /// 查询热卖商品
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectHotProduct()
        {
            string sql = string.Format("select top 3 * from product where hot='1' order by NEWID()");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        /// <summary>
        /// 查询所有热卖商品
        /// </summary>
        /// <returns></returns>
        public static List<ProductInfo> SelectHotProductAll()
        {
            string sql = string.Format("select * from product where hot='1' order by NEWID()");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }
        /// <summary>
        /// 查询新商品
        /// </summary>
        /// <returns>DataTable</returns>
        public static List<ProductInfo> SelectNewProduct()
        {
            string sql = string.Format("select top 3 * from product order by addtime desc");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        /// <summary>
        /// 查询所有新商品
        /// </summary>
        /// <returns>DataTable</returns>
        public static List<ProductInfo> SelectNewProductAll()
        {
            string sql = string.Format("select * from product order by addtime desc");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        public static List<ProductInfo> SelectProductByClassID(int classid)
        {
            string sql = "select * from product where classid='" + classid + "'";
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        /// <summary>
        /// 搜索功能
        /// </summary>
        /// <param name="name">用户输入的搜索字段</param>
        /// <returns></returns>
        public static List<ProductInfo> ShowSearch(string name)
        {
            string sql = string.Format("select * from product where productname like '%" + name + "%'");
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        /// <summary>
        /// 根据商品名查出商品类别
        /// </summary>
        /// <param name="productname">string</param>
        /// <returns>string</returns>
        public static string SelectClassNameByProductName(string productname)
        {
            string sql = string.Format("select top 1 b.classname from product a,productlist b where a.classid = b.classid and a.productname like '%{0}%' ",productname);
            if (DBHelper.GetDataTable(sql).Rows.Count > 0)
            {
                return DBHelper.GetDataTable(sql).Rows[0][0].ToString();
            }
            else
            {
                return "";
            }
            
        }

        /// <summary>
        /// 根据商品ID查询商品信息
        /// </summary>
        /// <returns>DataTable</returns>
        public static List<ProductInfo> SelectById(int productid)
        {
            string sql = string.Format("select * from product where id={0}", productid);
            DataTable dt = DBHelper.GetDataTable(sql);
            List<ProductInfo> list = new List<ProductInfo>();
            DataNew(dt, list);
            return list;
        }

        /// <summary>
        /// 修改库存
        /// </summary>
        /// <param name="productid">商品ID</param>
        /// <param name="quantity">数量</param>
        /// <returns>bool</returns>
        public static bool UpdateQuantity(string productid,int quantity)
        {
            string sql = string.Format("update product set quantity = {0} where id = {1}",quantity,productid);
            return DBHelper.ExecuteNonQuery(sql);
        }


        /// <summary>
        /// 后台查询所有商品和类名
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable SelectProducts()
        {
            string sql = string.Format("select * from product,productlist where product.classid=productlist.classid");
            return DBHelper.GetDataTable(sql);

        }

        /// <summary>
        /// 分页查询商品
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable IndexProducts(int findex)
        {
            string sql = string.Format(@"select top {0} * from product,productlist 
where product.classid=productlist.classid and id not in (select top {1} id from Product order by id) 
order by id", findex * 12, (findex - 1) * 12);
            return DBHelper.GetDataTable(sql);

        }

        /// <summary>
        /// 添加商品
        /// </summary>
        /// <returns></returns>
        public static bool AddProducts(ProductInfo info)
        {
            string sql = string.Format(@"insert into product values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", info.ProductName, info.ClassId, info.ProductPrice, info.Quantity, info.Hot, info.ProductPic, info.AddTime);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 根据ID删除商品
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public static bool DeleteProducts(int id)
        {
            string sql = string.Format(@"delete product where id={0}", id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 修改商品
        /// </summary>
        /// <returns></returns>
        public static bool UpdateProducts(ProductInfo info)
        {
            string sql = string.Format(@"update product set productname='{0}',classid='{1}',productprice='{2}',quantity='{3}',hot='{4}',productpic='{5}',addtime='{6}' where id='{7}'", info.ProductName, info.ClassId, info.ProductPrice, info.Quantity, info.Hot, info.ProductPic, info.AddTime, info.Id);
            return DBHelper.ExecuteNonQuery(sql);
        }

        ///// <summary>
        ///// 根据商品ID查询商品信息
        ///// </summary>
        ///// <returns>DataTable</returns>
        //public static List<ProductInfo> SelectById(int productid)
        //{
        //    string sql = string.Format("select * from product where id={0}", productid);
        //    DataTable dt = DBHelper.GetDataTable(sql);
        //    List<ProductInfo> list = new List<ProductInfo>();
        //    DataNew(dt, list);
        //    return list;
        //}

        /// <summary>
        /// 商品销量排名
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectXiao()
        {
            string sql = string.Format("select top 5 productid,count(*) shu  from orderinfo group by productid");
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 根据商品分类ID查询商品分类
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectByClassId(int classid)
        {
            string sql = string.Format("select * from product where classid={0}", classid);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 到订单中查询是否可删除商品
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectOrderByProductidId(int productid)
        {
            string sql = string.Format("select * from orderinfo where productid={0}",productid);
            return DBHelper.GetDataTable(sql);
        }

        /// <summary>
        /// 前台商场查询所有商品
        /// </summary>
        /// <param name="productid"></param>
        /// <returns></returns>
        public static DataTable SelectProductAll()
        {
            string sql = string.Format("select * from product");
            return DBHelper.GetDataTable(sql);

        }


    }
}
