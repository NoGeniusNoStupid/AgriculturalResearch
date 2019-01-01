using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class UpdatePwd : PowerBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Pwd.Text != SurePwd.Text)
            {
                Message("两次输入密码不一致！");
                return;
            }
            //获取参数
            if (Request.QueryString["power"] == null) //表示用户
            {
                
                int personId = Convert.ToInt32(Session["PersonId"]);
                var person = DB.Person.FirstOrDefault(a => a.Id == personId);
               
                if (person.Pwd != OldPwd.Text)
                {
                    Message("原密码错误！",true);
                    return;
                }
                person.Pwd = Pwd.Text;
                DB.Entry(person).State = EntityState.Modified;
              
            }
            else //表示管理员
            {

                int adminId = Convert.ToInt32(Session["AdminId"]);
                var admin = DB.Admin.FirstOrDefault(a => a.Id == adminId);
                if (admin.Pwd != OldPwd.Text)
                {
                    Message("原密码错误！", true);
                    return;
                }
                admin.Pwd = Pwd.Text;
                DB.Entry(admin).State = EntityState.Modified;
            }
            DB.SaveChanges();
            Message("保存成功！", true);
        }
    }
}