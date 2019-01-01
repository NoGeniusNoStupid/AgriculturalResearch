using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgriculturalResearch
{
    public partial class PersonIndex :PageBase
    {
        public Person PageModel = new Person();

        protected void Page_Load(object sender, EventArgs e)
        {
            int personId = Convert.ToInt32(Session["PersonId"]);
            PageModel = DB.Person.FirstOrDefault(a => a.Id == personId);

        }
    }
}