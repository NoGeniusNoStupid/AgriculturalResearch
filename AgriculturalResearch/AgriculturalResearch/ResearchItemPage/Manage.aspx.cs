using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ResearchItemPage
{
    public partial class Manage : PowerBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageLoad();
            }
        }

        //事件在所有回发数据和视图状态数据都加载到页以及页上的所有控件中后发生。
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            foreach (GridViewRow  row in GvData.Rows)
            {
                //获取四个按钮
                LinkButton AgreeButton = row.Cells[9].FindControl("AgreeButton") as LinkButton;
                LinkButton RefuseButton = row.Cells[9].FindControl("RefuseButton") as LinkButton;
                LinkButton PostButton = row.Cells[9].FindControl("PostButton") as LinkButton;
                LinkButton RevokeButton = row.Cells[9].FindControl("RevokeButton") as LinkButton;

                HyperLink HyperLink3 = row.Cells[10].FindControl("HyperLink3") as HyperLink;//编辑功能              
                //获取State的值
                Label stateLable = row.Cells[7].FindControl("State") as Label;
                string state = stateLable.Text ;
                if (Session["AdminId"] != null)
                {
                    HyperLink3.Visible = false;

                    if (state == "同意")
                       RefuseButton.Visible=true;
                    else if (state == "拒绝")
                       AgreeButton.Visible = true;
                    else if (state == "待审核")
                    {
                        RefuseButton.Visible = true;
                        AgreeButton.Visible = true;
                    }
                }
                else
                {
                    HyperLink3.Visible = true;

                    if (state == "待审核")
                        RevokeButton.Visible = true;
                    else if (state == "暂存")
                        PostButton.Visible = true;
                }
            }
        }
        //删除
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(GvData.DataKeys[e.RowIndex].Values[0].ToString());
            var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == ID);
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
        //绑定页面
        private void PageLoad()
        {
            string where = search.Text;//搜索条件
            if (Session["AdminId"] != null)
            {
                if (string.IsNullOrEmpty(where))
                {
                    GvData.DataSource = DB.ResearchItem.Where(a => true).ToList();
                }
                else
                {
                    GvData.DataSource = DB.ResearchItem.Where(a => a.ItemName.Contains(where)).ToList();
                }
            }
            else
            {

                int id = Convert.ToInt32(Session["PersonId"].ToString());
                if (string.IsNullOrEmpty(where))
                {
                    GvData.DataSource = DB.ResearchItem.Where(a => a.PersonId == id).ToList();
                }
                else
                {
                    GvData.DataSource = DB.ResearchItem.Where(a =>a.PersonId == id  && a.ItemName.Contains(where)).ToList();
                }
            }
            GvData.DataBind();
        }
        //审核功能实现
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == ID);
            switch (e.CommandName)
            {
                case "Agree":
                    Item.State = "同意";
                    break;
                case "Refuse":
                    Item.State = "拒绝";
                    break;
                case "Post":
                    Item.State = "待审核";
                    break;
                case "Revoke":
                    Item.State = "暂存";
                    break;
                default:
                    break;
            }
            DB.Entry(Item).State = EntityState.Modified;
            DB.SaveChanges();
            PageLoad();
        }  
    }
}