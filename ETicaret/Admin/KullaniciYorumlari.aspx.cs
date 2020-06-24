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
    public partial class KullaniciYorumlari : System.Web.UI.Page
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
            var yorumSonucu = (from urun in entities.Urunlers
                               join yorum in entities.UrunYorumlaris on urun.ID equals yorum.UrunID
                               join uye in entities.Uyelers on yorum.UyeID equals uye.ID
                               select new
                               {
                                   uye.ID,
                                   uye.Ad,
                                   urun.UrunAdi,
                                   yorum.Yorum,
                                   yorum.YorumDurum
                               }).ToList();
            GridView1.DataSource = yorumSonucu;
            GridView1.DataBind();
        }
        protected void btnOnay_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            entities.UrunYorumlaris.FirstOrDefault(x => x.ID == int.Parse(ID)).YorumDurum = 1;
            entities.SaveChanges();
            Goster();
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            entities.UrunYorumlaris.Remove(entities.UrunYorumlaris.FirstOrDefault(x => x.ID == int.Parse(ID)));
            entities.SaveChanges();
            Goster();

        }
    }
}