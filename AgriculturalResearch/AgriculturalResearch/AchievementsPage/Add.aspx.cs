using AgriculturalResearch.Public;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.AchievementsPage
{
    public partial class Add : PowerBase
    {
        public Achievements PageModel = new Achievements();
        protected void Page_Load(object sender, EventArgs e)
        {

            Panel2.Visible = false;
            Panel3.Visible = true;
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null)
                {
                    //编号
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    var Item = DB.Achievements.FirstOrDefault(a => a.Id == id);//获取对象
                    PageModel = Item;
                    AchTitle.Text = Item.AchTitle;
                    AchType.Text = Item.AchType;
                    AchContent.Text = Item.AchContent;
                    AchTel.Text = Item.AchTel;
                    Honor.Text = Item.Honor;
                    Label1.Text = Item.FileName;

                    Panel2.Visible = true;
                    Panel3.Visible = false;
                }
            }
        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] != null)
            {
                            
                if (!FileUpload2.HasFile && string.IsNullOrEmpty(Label1.Text))
                {
                    Message("请上传详细材料", false);
                    return;
                }
                //更新
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
              
                var Item = DB.Achievements.FirstOrDefault(a => a.Id == id);//获取对象
                Item.AchTitle = AchTitle.Text;
                Item.AchType = AchType.Text;
                Item.AchContent = AchContent.Text;
                Item.AchTel = AchTel.Text;
                Item.Honor = Honor.Text;
                if (FileUpload2.HasFile)
                {
                    string fileName = string.Empty;
                    Item.AchFile = FileUp.SaveFile(FileUpload2, Server.MapPath("~/UpFile/"), ref fileName);
                    Item.FileName = fileName;
                }
                Item.State = "待审";
                //更新数据
                DB.Entry(Item).State = EntityState.Modified;
                DB.SaveChanges();
            }
            else
            {
                //添加数据
                int personId = Convert.ToInt32(Session["PersonId"]);
                Achievements Item = new Achievements();
                Item.PersonId = personId;
                Item.AchTitle = AchTitle.Text;
                Item.AchType = AchType.Text;
                Item.AchContent = AchContent.Text;
                Item.AchTel = AchTel.Text;
                Item.Honor = Honor.Text;
                Item.State = "待审";
                Item.OperTime = DateTime.Now;
                string fileName = string.Empty;
                Item.AchFile = FileUp.SaveFile(FileUpload1, Server.MapPath("~/UpFile/"), ref fileName);
                Item.FileName = fileName;

                DB.Achievements.Add(Item);

                DB.SaveChanges();
            }
            Message("/AchievementsPage/Manage.aspx", "保存成功");
        }
    }
}