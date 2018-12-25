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
    


    public partial class Add :PowerBase
    {
        public ResearchItem PageModel = new ResearchItem();

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null)
                {
                    //编号
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == id);//获取对象
                    PageModel = Item;
                    ItemName.Text = Item.ItemName;
                    ItemType.Text = Item.ItemType;
                    ItemCompany.Text = Item.ItemCompany;
                    MajorPerson.Text = Item.MajorPerson;
                    Tel.Text = Item.Tel;
                    Funds.Text = Item.Funds.ToString();
                    ExeYear.Text = Item.ExeYear.ToString();
                    Label1.Text = Item.FileName;

                    Panel1.Visible = true;
                    Panel2.Visible = false;
                }
            }
        }
        //项目申报
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] != null)
            {
                //更新
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                var Item = DB.ResearchItem.FirstOrDefault(a => a.Id == id);//获取对象
                Item.ItemName = ItemName.Text;
                Item.ItemType = ItemType.Text;
                Item.ItemCompany = ItemCompany.Text;
                Item.MajorPerson = MajorPerson.Text;
                Item.Tel = Tel.Text;
                Item.Funds = Convert.ToDecimal(Funds.Text);
                Item.ExeYear = Convert.ToInt32(ExeYear.Text);
                if (FileUpload2.HasFile)
                {
                    string fileName = string.Empty;
                    Item.UpFile = SaveFile(FileUpload2, ref fileName);
                    Item.FileName = fileName;
                }
                Item.State = "暂存";

                //更新数据
                DB.Entry(Item).State = EntityState.Modified;
                DB.SaveChanges();
            }
            else
            {
                //添加              
                ResearchItem Item = new ResearchItem();
                Item.PersonId = Convert.ToInt32(Session["PersonId"]);
                Item.ItemName = ItemName.Text;
                Item.ItemType = ItemType.Text;
                Item.ItemCompany = ItemCompany.Text;
                Item.MajorPerson = MajorPerson.Text;
                Item.Tel = Tel.Text;
              
                Item.Funds = Convert.ToDecimal(Funds.Text);
                Item.ExeYear = Convert.ToInt32(ExeYear.Text);
                string fileName = string.Empty;
                Item.UpFile = SaveFile(FileUpload1, ref fileName);
                Item.FileName = fileName;
                Item.OperTime = DateTime.Now;
                Item.State = "暂存";

           

                //插入数据
                DB.ResearchItem.Add(Item);
                DB.SaveChanges();

                //将自己作为参与人员
                ItemPersonnel itemPerson = new ItemPersonnel();
                itemPerson.ItemId = Item.Id;
                itemPerson.PersonId = Convert.ToInt32(Session["PersonId"]);
                itemPerson.OperTime = DateTime.Now;
                DB.ItemPersonnel.Add(itemPerson);

                DB.SaveChanges();
            }
            Message("/ResearchItemPage/Manage.aspx", "保存成功");
        }


        /// <summary>
        /// 保存文件获取路径
        /// </summary>
        /// <param name="fileUpload"></param>
        /// <returns></returns>
        public string SaveFile(FileUpload fileUpload,ref string fileName)
        {
            string file = null;

            //判断是否上传了文件
            if (fileUpload.HasFile)
            {
                //指定上传文件在服务器上的保存路径
                string savePath = Server.MapPath("~/UpFile/");
                //检查服务器上是否存在这个物理路径，如果不存在则创建
                if (!System.IO.Directory.Exists(savePath))
                {
                    //需要注意的是，需要对这个物理路径有足够的权限，否则会报错
                    //另外，这个路径应该是在网站之下，而将网站部署在C盘却把文件保存在D盘
                    System.IO.Directory.CreateDirectory(savePath);
                }
                
                fileName = fileUpload.FileName;//原文件名

                //文件重命名
                file = fileUpload.FileName;
                string fileFormat = file.Split('.')[file.Split('.').Length - 1]; // 以“.”截取，获取“.”后面的文件后缀
                string timeStamp = DateTime.Now.Ticks.ToString(); // 获取当前时间的string类型
                string firstFileName = timeStamp.Substring(0, timeStamp.Length - 4); // 通过截取获得文件名
                file = firstFileName + "." + fileFormat;// 设置完整（文件名+文件格式） 
                
                //保存文件
                savePath = savePath + "\\" + file;
                fileUpload.SaveAs(savePath);//保存文件

             
            }
            return file;
        }
    }
}