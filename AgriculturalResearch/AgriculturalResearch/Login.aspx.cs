using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class Default : PageBase
    {
        //页面加载清空缓存
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    Session["PersonId"] = null;
            //    Session["AdminId"] = null;
            //}

        }
       
        //登陆功能实现
        protected void login_btn_Click(object sender, EventArgs e)
        {
            string name = user.Text.Trim();
            string pwd = pass.Text.Trim();
            if(RadioButton1.Checked==true)
            {
                var person = DB.Person.FirstOrDefault(a => a.Account == name && a.Pwd == pwd);
                if(person==null)
                {
                    Message("用户名或密码错误", true);
                    return;
                }
                Session["PersonId"] = person.Id;
                Session["AdminId"] = null;
                Message("/PersonIndex.aspx", "登陆成功", -1);
            }
            else
            {
                var admin = DB.Admin.FirstOrDefault(a => a.Account == name && a.Pwd == pwd);
                if (admin == null)
                {
                     Message("用户名或密码错误", true);
                     return;
                }
                Session["PersonId"] =null;
                Session["AdminId"] = admin.Id;
                Message("/Index.aspx", "登陆成功", -1);
            } 
        }
    }
}