using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class PersonHome : PageBase
    {
        public int ItemCount;
        public int AppItemCount;
        public int PaperCount;
        public int AchievementsCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            int personId=Convert.ToInt32(Session["PersonId"]);
            ItemCount = DB.ItemPersonnel.Where(a => a.PersonId == personId).Count();
            AppItemCount = DB.ResearchItem.Where(a => a.PersonId == personId).Count();
            PaperCount = DB.ResearchPaper.Where(a => a.PersonId == personId).Count();
            AchievementsCount = DB.Achievements.Where(a => a.PersonId == personId).Count();
        }
    }
}