using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ETicaret.Admin
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            var data = entities.Urunlers.ToList();
            Repeater1.DataSource = data;
            Repeater1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            
        }
    }
}