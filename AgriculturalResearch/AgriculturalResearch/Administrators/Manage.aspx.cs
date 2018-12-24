using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.Administrators
{
    public partial class Manage : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageLoad();
            }
        }
        //删除
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(GvData.DataKeys[e.RowIndex].Values[0].ToString());
            var admin = DB.Admin.FirstOrDefault(a => a.Id == ID);
            DB.Entry(admin).State = EntityState.Deleted;
            DB.SaveChanges();
            PageLoad();

        }
        //分页
        protected void GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvData.PageIndex = e.NewPageIndex;
            PageLoad();
        }

        //查询
        protected void Button1_Click(object sender, EventArgs e)
        {
            PageLoad();
        }
        //重新绑定页面
        private void PageLoad()
        {
            string where = search.Text;//搜索条件
            if (string.IsNullOrEmpty(where))
                GvData.DataSource = DB.Admin.Where(a => true).ToList();
            else
                GvData.DataSource = DB.Admin.Where(a => a.Name.Contains(where)).ToList();
            GvData.DataBind();
        }
    }
}