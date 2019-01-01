using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ResearchItemPage
{
    public partial class Detail : PowerBase
    {
        public ResearchItem PageModel = new ResearchItem();
        protected void Page_Load(object sender, EventArgs e)
        {
            //查看详情
            if (!IsPostBack)
            {
                if(Request.QueryString["power"]!=null)
                {
                    Panel1.Visible = false;
                }
                else
                {
                    Panel1.Visible = true;
                }
              
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                int personId = Convert.ToInt32(Session["PersonId"]);
                var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == id);//获取对象
                PageModel = Item;
                Label1.Text = Item.Id.ToString();//记录项目Id

                //绑定参与人员
                List<Person> personList = DB.Person.Where(a => true && a.Id != personId).ToList();
                foreach (var item in personList)
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = item.Name;
                    listItem.Value = item.Id.ToString();
                    DropDownList1.Items.Add(listItem);
                }
            }
        }

        //添加参与人员
        protected void Button1_Click(object sender, EventArgs e)
        {
            //获取到选择人员的Id
            int personId = Convert.ToInt32(DropDownList1.SelectedValue);
            int itemId=Convert.ToInt32( Label1.Text);
            //判断是否存在
            var isExit = DB.ItemPersonnel.FirstOrDefault(a => a.ItemId == itemId && a.PersonId == personId);
            if (isExit != null)
            {
                Message("该人员已经加入改项目，不需要重复添加！",false);
                return;
            }
            //添加
            ItemPersonnel itemPerson = new ItemPersonnel();
            itemPerson.ItemId = itemId;
            itemPerson.PersonId = personId;
            itemPerson.OperTime = DateTime.Now;
            DB.ItemPersonnel.Add(itemPerson);
            DB.SaveChanges();
            Message("添加成功", false);
            Response.Redirect(Request.Url.ToString());  
        }
        //删除人员
        protected void Button2_Click(object sender, EventArgs e)
        {   
            //获取到选择人员的Id
            int personId = Convert.ToInt32(DropDownList1.SelectedValue);
            int itemId = Convert.ToInt32(Label1.Text);
            //判断是否存在
            var isExit = DB.ItemPersonnel.FirstOrDefault(a => a.ItemId == itemId && a.PersonId == personId);
            if (isExit == null)
            {
                Message("该人员当前不存在与该项目中！", false);
                return;
            }
            DB.Entry(isExit).State = EntityState.Deleted;
            DB.SaveChanges();
            Message("删除成功", false);
            Response.Redirect(Request.Url.ToString());  
        }

    }
}