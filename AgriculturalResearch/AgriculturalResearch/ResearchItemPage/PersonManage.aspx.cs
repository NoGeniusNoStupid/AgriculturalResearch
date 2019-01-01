using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ResearchItemPage
{
    //参与人员查看自己的项目
    public partial class PersonManage : PowerBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageLoad();
            }


        }
        //分页
        protected void GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvData.PageIndex = e.NewPageIndex;
            PageLoad();
        }
         //绑定页面
        private void PageLoad()
        { 
            string where = search.Text;//搜索条件

            //获取用户id
            int perisonId = Convert.ToInt32(Session["PersonId"]);

            if (string.IsNullOrEmpty(where))
            {
                GvData.DataSource = DB.ItemPersonnel.Where(a => a.PersonId == perisonId&&a.ResearchItem.State=="同意").ToList();//查询出所有的项目
            }
            else
            {
                GvData.DataSource = DB.ItemPersonnel.Where(a => a.PersonId == perisonId && a.ResearchItem.State == "同意" && a.ResearchItem.ItemName.Contains(where)).ToList();//查询出所有的项目
            }       
            GvData.DataBind();
        }

        //查询
        protected void Button1_Click(object sender, EventArgs e)
        {
            PageLoad();
        }
    }
}