using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
     public class CommentsInfo
    {
        public int id { get; set; }
        public int user_id { get; set; }
        public int product_id { get; set; }
        public string contents { get; set; }
        public int audit { get; set; }
        public int stars { get; set; }
        public DateTime create_time { get; set; }

    }
}
