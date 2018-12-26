using AgriculturalResearch.Public;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch.ExpRecordPage
{
   

    public partial class Add : PowerBase
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
              
            }
        }
        //保存
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            int personId=Convert.ToInt32(Session["PersonId"]);
            ExpRecord Item = new ExpRecord();
            Item.PersonId = personId;
            Item.ItemId = id;
            Item.ExpContent = ExpContent.Text;
            if (FileUpload3.HasFile)
            {
                string fileName = string.Empty;
                Item.UpFile =FileUp.SaveFile(FileUpload3,Server.MapPath("~/UpFile/"),ref fileName);
                Item.FileName = fileName;
            }
            Item.State = "正常";
            Item.ExpTime =DateTime.Now;
            DB.ExpRecord.Add(Item);
            DB.SaveChanges();
            Response.Redirect("/ExpRecordPage/Manage.aspx?id=" + id);
        }
       
    }
}