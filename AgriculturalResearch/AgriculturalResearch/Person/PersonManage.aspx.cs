using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class PersonManage : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageLoad();
            }
        }
      
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID =Convert.ToInt32(GvData.DataKeys[e.RowIndex].Values[0].ToString());
            var persont = DB.Person.FirstOrDefault(a => a.Id == ID);
            DB.Entry(persont).State = EntityState.Deleted;
            DB.SaveChanges();
            PageLoad();

        }
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
                GvData.DataSource = DB.Person.Where(a => true).ToList();
            else
                GvData.DataSource = DB.Person.Where(a => a.Name.Contains(where)).ToList();
            GvData.DataBind();
        }
    }
}