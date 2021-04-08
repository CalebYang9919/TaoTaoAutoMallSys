using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ProductListInfo
    {
        public int ClassID { get; set; }      //分类商品ID
        public string ClassName { get; set; } //分类商品名称
        public ProductInfo productInfo;
    }
}
