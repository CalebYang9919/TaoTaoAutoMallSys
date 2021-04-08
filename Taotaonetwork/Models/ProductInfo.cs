using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 商品信息类
    /// </summary>
    public class ProductInfo
    {
        public int Id { get; set; }                                  //商品ID
        public int ClassId { get; set; }                             //商品类型
        public string ProductName { get; set; }                      //商品名称
        public float ProductPrice { get; set; }                      //商品价格
        public int Quantity { get; set; }                            //商品数量
        public int Hot { get; set; }                                 //是否热卖
        public string ProductPic { get; set; }                       //商品图片
        public DateTime AddTime { get; set; }                        //上架时间
        public string AdvertiSing = "";
    }
}
