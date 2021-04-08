using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class RegisterBLL
    {
        public static bool Register(String username, string pwd, string email, string mobile)
        {
                if (RegisterDAL.Register(username, pwd, email, mobile))
                {
                    return true;
                }
                else
                {
                    return false;
                }
        }

        public static bool IsUserName(String username)
        {
            return RegisterDAL.SelectByUserName(username);
        }
    }
}
