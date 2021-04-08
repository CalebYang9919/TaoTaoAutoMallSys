using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PayDAL
    {
        /// <summary>
        /// 查询购物车商品
        /// </summary>
        /// <param name="uid">用户ID</param>
        /// <param name="strIds">商品ID数组</param>
        /// <returns>DataTable</returns>
        public static DataTable SelectCartByPID(string uid,string[] strIds)
        {
            DataTable dt = new DataTable();
            DataColumn dc = null;
            dc = dt.Columns.Add("ID", Type.GetType("System.Int32"));
            dc.AutoIncrement = true;//自动增加
            dc.AutoIncrementSeed = 1;//起始为1
            dc.AutoIncrementStep = 1;//步长为1
            dc.AllowDBNull = false;//
            dc = dt.Columns.Add("productid", Type.GetType("System.Int32"));
            dc = dt.Columns.Add("quantity", Type.GetType("System.Int32"));
            dc = dt.Columns.Add("productname", Type.GetType("System.String"));
            dc = dt.Columns.Add("productprice", Type.GetType("System.Int32"));
            dc = dt.Columns.Add("productpic", Type.GetType("System.String"));
            for (int i = 0; i < strIds.Length; i++)
            {
                string sql = string.Format("select a.productid,a.quantity,b.productname,b.productprice,b.productpic  from Cart a,product b where a.productid = b.id and a.userid = {0} and a.productid = {1}", uid, strIds[i]);
                DataTable tblDatas = DBHelper.GetDataTable(sql);
                

                DataRow newRow;
                newRow = dt.NewRow();
                newRow["productid"] = int.Parse(tblDatas.Rows[0]["productid"].ToString());
                newRow["quantity"] = int.Parse(tblDatas.Rows[0]["quantity"].ToString());
                newRow["productname"] = tblDatas.Rows[0]["productname"].ToString();
                newRow["productprice"] = int.Parse(tblDatas.Rows[0]["productprice"].ToString());
                newRow["productpic"] = tblDatas.Rows[0]["productpic"].ToString();
                dt.Rows.Add(newRow);
            }

            return dt;
        }
    }
}
