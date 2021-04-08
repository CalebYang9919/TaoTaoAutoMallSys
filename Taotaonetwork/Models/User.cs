using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class User
    {
        public int id { get; set; }
        public string user_name { get; set; }
        public string pwd { get; set; }
        public string email { get; set; }
        public string mobile { get; set; }
        public int user_type { get; set; }
        public string UserImg { get; set; }
    }
}
