using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class PageBase : System.Web.UI.Page
    {
        /// <summary>
        /// 数据库操作对象
        /// </summary>
        public AgriculturalResearchEntities DB
        {
            get
            {
                return (AgriculturalResearchEntities)DBContextFactory.CreateDbContext();
            }
        }
        /// <summary>
        /// 仅提示
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="isHistory">返回上一页</param>
        /// <returns></returns>
        protected void Message(string msg, bool isHistory)
        {
            string tip = string.Empty;
            if (isHistory)
                tip = "self.location=document.referrer;";
            string strTip = string.Format(@"<script languge='javascript'>alert('{0}');{1}</script>", msg, tip);
            Response.Write(strTip);   
        }
        /// <summary>
        /// 消息提示
        /// </summary>
        /// <param name="url"></param>
        /// <param name="msg"></param>
        /// <param name="ros"></param>
        protected void Message(string url, string msg = null, int ros = -1, bool parent=false)
        {
            if (string.IsNullOrEmpty(msg))
            {
                if (ros > 0)
                    msg = "操作成功";
                else
                    msg = "操作失败";
            }       
            string strTip = string.Empty;
            if (parent)
                strTip = string.Format(@"<script languge='javascript'>alert('{0}');window.parent.location.href='{1}'</script>", msg, url);
            else
               strTip = string.Format(@"<script languge='javascript'>alert('{0}');window.location.href='{1}'</script>", msg, url);
            Response.Write(strTip);        
        }
        
        //.parent
    }
}