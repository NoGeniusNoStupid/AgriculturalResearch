using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class Index : PageBase
    {

        public Admin PageModel = new Admin();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            int adminId = Convert.ToInt32(Session["AdminId"]);
            PageModel = DB.Admin.FirstOrDefault(a => a.Id == adminId);
        }
    }
}