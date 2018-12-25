using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.Administrators
{
    public partial class Add : PowerBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null)
                {
                    //编号
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    var admin = DB.Admin.FirstOrDefault(a => a.Id == id);//获取对象
                    Account.ReadOnly = true;
                    Account.Text = admin.Account;
                    Name.Text = admin.Name;
                    Tel.Text = admin.Tel;
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
                var admin = DB.Admin.FirstOrDefault(a => a.Id == id);//获取对象
                admin.Account = Account.Text;
                admin.Name = Name.Text;
                admin.Tel = Tel.Text;
                //保存数据
                DB.Entry(admin).State = EntityState.Modified;
                DB.SaveChanges();
            }
            else
            {
                //添加
                Admin admin = new Admin();
                admin.Account = Account.Text;
                admin.Name = Name.Text;
                admin.Tel = Tel.Text;
                admin.Pwd = "123456";//默认
                admin.AddTime = DateTime.Now;
                admin.Role = "管理员";
                //插入数据
                DB.Admin.Add(admin);
                DB.SaveChanges();
            }
            //跳转
            Message("/Administrators/Manage.aspx", "保存成功");
        }
    }
}