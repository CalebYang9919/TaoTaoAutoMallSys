﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Taotaonetwork
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void a_click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["uid"] = null;
        }
    }
}