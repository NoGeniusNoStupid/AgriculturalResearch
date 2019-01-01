using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ResearchPaperPage
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
        //事件在所有回发数据和视图状态数据都加载到页以及页上的所有控件中后发生。

        //删除
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int ID = Convert.ToInt32(GvData.DataKeys[e.RowIndex].Values[0].ToString());
            var Item = DB.ResearchPaper.FirstOrDefault(a => a.Id == ID);
            DB.Entry(Item).State = EntityState.Deleted;
            DB.SaveChanges();
            PageLoad();
        }
        //查询
        protected void Button1_Click(object sender, EventArgs e)
        {
            PageLoad();
        }
        //分页
        protected void GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvData.PageIndex = e.NewPageIndex;
            PageLoad();
        }
        //审核功能实现
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            var Item = DB.ResearchPaper.FirstOrDefault(a => a.Id == ID);
            switch (e.CommandName)
            {
                case "Agree":
                    Item.State = "同意";
                    break;
                case "Refuse":
                    Item.State = "拒绝";
                    break;
                default:
                    break;
            }
            DB.Entry(Item).State = EntityState.Modified;
            DB.SaveChanges();
            PageLoad();
        }

        private void PageLoad()
        {
            //查看所有记录  
            //int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            string where = search.Text;//搜索条件

            if (Session["PersonId"] == null)
            {
                if (string.IsNullOrEmpty(where))
                    GvData.DataSource = DB.ResearchPaper.Where(a => true).ToList();
                else
                    GvData.DataSource = DB.ResearchPaper.Where(a => a.PaperTitle.Contains(where)).ToList();
            }
            else
            {
                int personId = Convert.ToInt32(Session["PersonId"]);
                if (string.IsNullOrEmpty(where))
                    GvData.DataSource = DB.ResearchPaper.Where(a => a.PersonId == personId).ToList();
                else
                    GvData.DataSource = DB.ResearchPaper.Where(a => a.PersonId == personId && a.PaperTitle.Contains(where)).ToList();
            }
            GvData.DataBind();
            //判断

            if (Session["AdminId"] == null)
                GvData.Columns[7].Visible = false;
            else
                GvData.Columns[7].Visible = true;
        }
    }
}