using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ResearchItemPage
{
    public partial class Detail : PageBase
    {
        public ResearchItem PageModel = new ResearchItem();
        protected void Page_Load(object sender, EventArgs e)
        {
            //查看详情
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == id);//获取对象
                PageModel = Item;
            }
        }

    }
}