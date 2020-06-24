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
    public partial class Kullanicilar : System.Web.UI.Page
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
            var kullanıcılar = entities.Kullanicilars.OrderBy(x => x.Ad).ThenBy(x => x.Soyad).ToList();
            GridView1.DataSource = kullanıcılar;
            GridView1.DataBind();
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            if (ID == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert",
                    "alert('ADMIN Kullanıcı silinemez!');", true);
            }
            else
            {
                entities.Kullanicilars.Remove(entities.Kullanicilars.FirstOrDefault(x => x.ID == int.Parse(ID)));
                entities.SaveChanges();
            }
            Goster();
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();

            var kullanici = entities.Kullanicilars.FirstOrDefault(x => x.ID == int.Parse(ID));

            if (kullanici != null)
            {

                txtAd.Text = kullanici.Ad;
                txtSoyad.Text = kullanici.Soyad;
                txtEmail.Text = kullanici.Email;
                txtSifre.Text = kullanici.sifre;
                txtYetki.SelectedValue = kullanici.Yetki.ToString();
                hdnID.Value = ID;
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            string ID = hdnID.Value;            
            ETicaret.Kullanicilar kullanici;
            if (ID == "0") kullanici = new ETicaret.Kullanicilar();
            else kullanici = entities.Kullanicilars.FirstOrDefault(x => x.ID == int.Parse(ID));
            kullanici.Ad = txtAd.Text;
            kullanici.Soyad = txtSoyad.Text;
            kullanici.Email = txtEmail.Text;
            kullanici.sifre = txtSifre.Text;
            kullanici.Yetki = int.Parse(txtYetki.SelectedValue);
            if (ID == "0") entities.Kullanicilars.Add(kullanici);
            entities.SaveChanges();

            hdnID.Value = "0";
            txtAd.Text = "";
            txtSoyad.Text = "";
            txtSifre.Text = "";
            txtEmail.Text = "";
            txtYetki.SelectedValue = "1";

            Goster();
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            hdnID.Value = "0";
            txtAd.Text = "";
            txtSoyad.Text = "";
            txtSifre.Text = "";
            txtEmail.Text = "";
            txtYetki.SelectedValue = "1";
        }
    }
}