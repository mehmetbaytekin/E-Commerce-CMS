using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaret.Admin
{
    public partial class Siparisler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                projeEntities entities = new projeEntities();
                var data = entities.SiparisDurumlaris.ToList();
                ddlSiparisDurumu.DataSource = data;
                ddlSiparisDurumu.DataValueField = "ID";
                ddlSiparisDurumu.DataTextField = "SiparisDurumu";
                ddlSiparisDurumu.DataBind();

            }
            goster();
        }
        public void goster() {
            projeEntities entities = new projeEntities();
            var data = (from siparis in entities.Siparislerims
                        join urun in entities.Urunlers on siparis.UrunID equals urun.ID
                        join siparisdurum in entities.SiparisDurumlaris on siparis.SiparisDurumu equals siparisdurum.ID
                        join uye in entities.Uyelers on siparis.UyeID equals uye.ID
                        select new
                        {
                            siparis.ID,
                            uye.Ad,
                            urun.UrunAdi,
                            siparis.Tarih,
                            siparisdurum.SiparisDurumu
                        }).ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();

        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        { //hdnId ile düzenle butonundan gelen ID yi tutabildik
            string ID = hdnID.Value;
            
            string Sdurum = ddlSiparisDurumu.SelectedValue;
            projeEntities entities = new projeEntities();
            entities.Siparislerims.FirstOrDefault(x => x.ID == int.Parse(ID)).SiparisDurumu = int.Parse(Sdurum);
            entities.SaveChanges();
            goster();
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            LinkButton b = sender as LinkButton;
            ID = b.CommandArgument.ToString();

            hdnID.Value = ID.ToString();
            projeEntities entities = new projeEntities();
            var sip = (
                from siparis in entities.Siparislerims
                join urun in entities.Urunlers on siparis.UrunID equals urun.ID
                join siparisdurum in entities.SiparisDurumlaris on siparis.SiparisDurumu equals siparisdurum.ID
                select new
                {
                    siparisdurum.SiparisDurumu,
                }
                ).FirstOrDefault().SiparisDurumu;
            
            if (sip != null)
            {

                ddlSiparisDurumu.DataTextField = sip.ToString();
              
            }
        }
    }
}