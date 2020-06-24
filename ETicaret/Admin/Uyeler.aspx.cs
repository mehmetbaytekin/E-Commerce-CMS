using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ETicaret.Admin
{
    public partial class Uyeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Goster();
            }   
        }
       void Goster()
       {
            projeEntities entities = new projeEntities();
            var uyeler = entities.Uyelers.OrderBy(x=> x.ID).ToList();
           GridView1.DataSource = uyeler;
           GridView1.DataBind();
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            entities.Uyelers.Remove(entities.Uyelers.FirstOrDefault(x => x.ID == int.Parse(ID)));
            entities.SaveChanges();
            Goster();
        }

      
    }
}