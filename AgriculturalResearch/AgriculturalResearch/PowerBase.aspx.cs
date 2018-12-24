using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class PowerBase : PageBase
    {
        //权限验证
        protected override void OnInit(EventArgs e)
        {
            if (Session["AdminId"] == null && Session["PersonId"] == null)
            {
                Message("/Login.aspx", "请先登入后再进行操作",-1,true);
            }

            //权限校验
            base.OnInit(e);
        }
    }
}