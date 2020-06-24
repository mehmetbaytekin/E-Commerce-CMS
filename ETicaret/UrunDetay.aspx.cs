using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ETicaret
{
    public partial class UrunDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);

            if (RouteData.Values["UrunID"] != null)
                ID = Convert.ToInt32(RouteData.Values["UrunID"].ToString());

            if (ID == 0)
            {
                Response.Redirect("/");
            }

            UrunGetir(ID);

        }
        public void UrunGetir(int ID)
        {
            projeEntities entities = new projeEntities();
            var urunSonucu = (from urun in entities.Urunlers
                              join kategori in entities.UrunKategorileris on urun.UrunKategorisi equals kategori.ID
                              join resimler in entities.UrunResimleris on ID equals resimler.UrunID

                              select new
                              {
                                  ID,
                                  KID = urun.UrunKategorisi,
                                  urun.UrunAdi,
                                  urun.UrunAciklamasi,
                                  urun.UrunFiyati,
                                  urun.StokMiktari,
                                  urun.UrunMarkasi,
                                  kategori.KategoriAdi,

                              }).FirstOrDefault(x => x.ID == ID);
            if (urunSonucu != null)
            {
                txtUrunAdi.Text = urunSonucu.UrunAdi;
                txtUrunFiyati.Text = urunSonucu.UrunFiyati.HasValue == true ? urunSonucu.UrunFiyati.Value.ToString() : "0";
                lnkKategori.Text = urunSonucu.KategoriAdi;
                lnkKategori.PostBackUrl = "Kategori/" + urunSonucu.KategoriAdi.ToString().Replace(' ', '_') + "/" + urunSonucu.KID.ToString();
                ltlUrunAciklama.Text = urunSonucu.UrunAciklamasi;
                ltlStokMiktari.Text = urunSonucu.StokMiktari.ToString();
                ltlUrunMarkasi.Text = urunSonucu.UrunMarkasi;

                var resimSonucu = entities.UrunResimleris.Where(x => x.UrunID == ID).ToList();


                if (resimSonucu.Count > 0)
                {
                    lnkAnaResim.Text = "<img src='/UrunResimleri/" + resimSonucu.FirstOrDefault().Resim + "' style='width:100%;' />";
                    lnkAnaResim.PostBackUrl = "/ UrunResimleri / " + resimSonucu.FirstOrDefault().Resim;
                    rptUrunResimleri.DataSource = resimSonucu;
                    rptUrunResimleri.DataBind();
                }

                var yorumSonucu = (from urun in entities.Urunlers
                                   join yorum in entities.UrunYorumlaris on urun.ID equals yorum.UrunID
                                   join uye in entities.Uyelers on yorum.UyeID equals uye.ID
                                   where yorum.YorumDurum == 1 && yorum.UyeID == ID
                                   select new
                                   {
                                       uye.Ad,
                                       yorum.Yorum
                                   }).ToList();
                Rptyorumlar.DataSource = yorumSonucu;
                Rptyorumlar.DataBind();





            }
        }
        protected void btnSepeteEkle_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(RouteData.Values["UrunID"].ToString());
            int miktar = Convert.ToInt32(txtMiktar.Text);

            List<Sepet> sepet;

            if (Session["SEPET"] == null)
                sepet = new List<Sepet>();
            else
                sepet = Session["SEPET"] as List<Sepet>;

            Sepet urun = new Sepet();
            urun.UrunAdi = txtUrunAdi.Text;
            urun.UrunID = ID;
            urun.Fiyat = Convert.ToDouble(txtUrunFiyati.Text);
            urun.Miktar = miktar;
            urun.Marka = ltlUrunMarkasi.Text;


            sepet.Add(urun);

            Session["SEPET"] = sepet;
        }

        protected void YorumEkle_Click(object sender, EventArgs e)
        {
            txtYorum.Visible = true;


            int urunID = Convert.ToInt32(RouteData.Values["UrunID"].ToString());
            string yorum = txtYorum.Text;
            int UyeID = Convert.ToInt32(Session["UYEBILGISI"]);

            string Tarih = DateTime.Now.ToString("yyyy-MM-dd");



            if (txtYorum.Text != null)
            {
                projeEntities entities = new projeEntities();
                UrunYorumlari urunyorumları = new UrunYorumlari()
                {
                    UrunID = urunID,
                    Tarih = DateTime.Today,
                    UyeID = UyeID,
                    Yorum = yorum,
                    YorumDurum = 0

                };
                entities.UrunYorumlaris.Add(urunyorumları);
                




                if (entities.SaveChanges()>0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(),
                        "myalert",
                        "alert('Yorumunuz başarıyla incelemeye alınmıştır!');", true);
                    txtYorum.Text = "";
                }
                else if (UyeID == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(),
                        "myalert",
                        "alert('Lütfen giriş yapınız!');", true);
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                       "myalert",
                       "alert('Lütfen yorumunuzu giriniz!');", true);
            }

        }
    }
}