using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ExpRecordPage
{
    public partial class Manage : PowerBase
    {
        public ResearchItem PageModel = new ResearchItem();

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
            var Item = DB.ExpRecord.FirstOrDefault(a => a.Id == ID);
            int personId = Convert.ToInt32(Session["PersonId"]);
            if (Item.PersonId != personId) 
            {
                Message("只能删除自己的实验记录！");
                return;
            }
            DB.Entry(Item).State = EntityState.Deleted;
            DB.SaveChanges();
            PageLoad();
        }
        //实验记录
        private void PageLoad()
        {
            //查看所有记录  
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            var list = DB.ExpRecord.Where(a => a.ItemId == id).ToList();
            GvData.DataSource = list;
            GvData.DataBind();

            PageModel = DB.ResearchItem.FirstOrDefault(a => a.Id == id);//获取项目对象
        }
        //分页
        protected void GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvData.PageIndex = e.NewPageIndex;
            PageLoad();
        }
    }
       
}