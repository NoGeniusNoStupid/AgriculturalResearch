using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
     
    public partial class Home : PowerBase
    {
        public int AdminCount;
        public int PersonCount;
        public int AppItemCount;
        public int PaperCount;
        public int AchievementsCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            int personId = Convert.ToInt32(Session["PersonId"]);

            AdminCount = DB.Admin.Where(a => true).Count();
            PersonCount = DB.Person.Where(a => true).Count();
            AppItemCount = DB.ResearchItem.Where(a =>true).Count();
            PaperCount = DB.ResearchPaper.Where(a => true).Count();
            AchievementsCount = DB.Achievements.Where(a => true).Count();
        }
    }
}