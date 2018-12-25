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
    public partial class PersonAdd : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {    
                if (Request.QueryString["type"] != null)
                {
                    //编号
                   int id =Convert.ToInt32( Request.QueryString["id"].ToString());
                   var person = DB.Person.FirstOrDefault(a => a.Id == id);//获取对象
                   Account.ReadOnly = true;
                   Account.Text = person.Account;
                   Name.Text = person.Name;
                   Age.Text = person.Age;
                   Sex.Text = person.Sex;
                   Tel.Text = person.Tel;
                   Title.Text = person.Title;
                   major.Text = person.major;
                   College.Text = person.College;
                }
            }
        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] != null)
            {
                //编号
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                var person = DB.Person.FirstOrDefault(a => a.Id == id);//获取对象
                person.Account = Account.Text;
                person.Name = Name.Text;
                person.Age = Age.Text;
                person.Sex = Sex.Text;
                person.Tel = Tel.Text;
                person.Title = Title.Text;
                person.major = major.Text;
                person.College = College.Text;
                //保存数据
                DB.Entry(person).State = EntityState.Modified;
                DB.SaveChanges();
            }
            else
            {
                //添加
                Person person = new Person();
                person.Account = Account.Text;
                person.Name = Name.Text;
                person.Age = Age.Text;
                person.Sex = Sex.Text;
                person.Tel = Tel.Text;
                person.Title = Title.Text;
                person.major = major.Text;
                person.College = College.Text;
                person.Pwd = "123456";//默认
                person.RegTime = DateTime.Now;
                //插入数据
                DB.Person.Add(person);
                DB.SaveChanges();
            }
            //跳转
            //Message("/PersonManage.aspx", "保存成功");
          
            if(Session["AdminId"]==null)
                Message("保存成功", true);
            else
                Message("/PersonManage.aspx", "保存成功");
        }
    }
}