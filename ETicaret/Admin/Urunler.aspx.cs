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
    public partial class Urunler : System.Web.UI.Page
    {
        int ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                projeEntities entities = new projeEntities();
                goster();
                var data = entities.UrunKategorileris.ToList();
                Kategori.DataValueField = "ID";
                Kategori.DataTextField = "KategoriAdi";
                Kategori.DataSource = data;
                Kategori.DataBind();
            }
        }

        void goster()
        {
            projeEntities entities = new projeEntities();
            var data = (from urun in entities.Urunlers
                        join urunkategori in entities.UrunKategorileris on urun.UrunKategorisi equals urunkategori.ID
                        select new
                        {
                            urun.ID,
                            urun.UrunAdi,
                            urun.UrunKategorisi,
                            urunkategori.KategoriAdi,
                            urun.StokMiktari
                        }).ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            double orjfiyat = Convert.ToDouble(Fiyat.Text);
            double indirim = Indirim.Text == string.Empty ? Convert.ToDouble(Indirim.Text) : (double)0;
            double fiyat = orjfiyat - (orjfiyat * indirim / 100);
            int puan = 0;
            projeEntities entities = new projeEntities();
            ETicaret.Urunler urun;
            if (hdnID.Value == "0") urun = new ETicaret.Urunler();
            else urun = entities.Urunlers.FirstOrDefault(x => x.ID == int.Parse(hdnID.ID));
            urun.UrunAdi = UrunAdi.Text;
            urun.UrunKategorisi = int.Parse(Kategori.SelectedValue);
            urun.UrunMarkasi = Marka.Text;
            urun.UrunFiyati = fiyat;
            urun.IndirimOrani = indirim;
            urun.UrunOrijinalFiyati = orjfiyat;
            urun.StokMiktari = Convert.ToDouble(StokMiktari.Text);
            urun.UrunAciklamasi = Aciklama.Text;
            urun.DegerlendirmePuani = Convert.ToDouble(puan);
            urun.Aktif = true;
            if (hdnID.Value == "0") urun = entities.Urunlers.Add(urun);
            if (entities.SaveChanges() > 0) goster();
            else Page.ClientScript.RegisterStartupScript(this.GetType(),
                "myalert",
                "alert('Bir sorun oluştu ürün güncellenemedi!');", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton b = sender as LinkButton;
            ID = Convert.ToInt32(b.CommandArgument);
            hdnID.Value = ID.ToString();
            projeEntities entities = new projeEntities();
            var urun = entities.Urunlers.FirstOrDefault(x => x.ID == int.Parse(hdnID.ID));
            if (urun != null)
            {
                UrunAdi.Text = urun.UrunAdi;
                Marka.Text = urun.UrunMarkasi;
                Fiyat.Text = urun.UrunOrijinalFiyati.ToString();
                Indirim.Text = urun.IndirimOrani.ToString();

                Kategori.SelectedValue = urun.UrunKategorisi.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            hdnID.Value = "0";
            UrunAdi.Text = "";
            Marka.Text = "";
            Aciklama.Text = "";
            Fiyat.Text = "";
            Indirim.Text = "";
            StokMiktari.Text = "";
            Kategori.ClearSelection();
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            var urun = entities.Urunlers.FirstOrDefault(x => x.ID == int.Parse(hdnID.ID));
            entities.Urunlers.Remove(urun);
            entities.SaveChanges();
            goster();
        }

        protected void btnResim_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            hdnID.Value = ID;
            UrunResimleri();
        }

        protected void btnResimUpload_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("/UrunResimleri/");
            //string dosyaadi = FileUpload1.FileName;
            string dosyaadi = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";

            FileUpload1.SaveAs(path + dosyaadi);
            projeEntities entities = new projeEntities();
            ETicaret.UrunResimleri resim = new UrunResimleri()
            {
                UrunID = int.Parse(hdnID.Value),
                Resim = dosyaadi,
                Vitrin =chkVitrin.Checked
            };
            entities.UrunResimleris.Add(resim);
            entities.SaveChanges();
        }

        void UrunResimleri()
        {
            projeEntities entities = new projeEntities();
            var data = entities.UrunResimleris.Where(x => x.UrunID == int.Parse(hdnID.Value)).ToList();
            rptResimler.DataSource = data;
            rptResimler.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;

            hdnResimID.Value = ID;
            projeEntities entities = new projeEntities();
            var data = entities.UrunResimleris.FirstOrDefault(x => x.ID == int.Parse(hdnResimID.Value));
            chkVitrin.Checked = data.Vitrin.HasValue ? data.Vitrin.Value : false;
        }
    }
}
