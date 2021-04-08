using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Models;
using System.Data;

namespace BLL
{
    public class CommentsBLL
    {
        /// <summary>
        /// 查询评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static DataTable SelectsComments(CommentsInfo com)
        {
            return CommentsDAL.SelectsComments(com);
        }

        /// <summary>
        /// 添加评论
        /// </summary>
        /// <param name="com"></param>
        /// <returns></returns>
        public static bool AddComments(CommentsInfo com)
        {
            if (CommentsDAL.SelectIs(com).Rows.Count > 0)
            {
                return CommentsDAL.AddComments(com);
            }
            else
            {
                return false;
            }

        }

    }
}
