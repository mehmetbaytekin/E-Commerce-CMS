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
    public partial class satinal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SEPET"] == null)
                Response.Redirect("/");

            if (!IsPostBack)
            {
                List<Sepet> sepet = Session["SEPET"] as List<Sepet>;
                grdSepet.DataSource = sepet;
                grdSepet.DataBind();
                var toplam = sepet.Sum(x => x.Miktar * x.Fiyat);
                int kargoUcret = 9;
                lblkargoUcreti.Text = kargoUcret.ToString();
                ltlToplamFiyat.Text = toplam.ToString();

            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            int ID = Convert.ToInt32(btn.CommandArgument);
            List<Sepet> sepet = Session["SEPET"] as List<Sepet>;
            sepet.RemoveAt(ID);
            Session["SEPET"] = sepet;
            grdSepet.DataSource = sepet;
            grdSepet.DataBind();
        }

        protected void btnAdres_Click(object sender, EventArgs e)
        {
            lblAdres.Visible = true;
            lblTelefon.Visible = true;
            txtAdres.Visible = true;
            txtTelefon.Visible = true;
            btnSepetTamamla.Visible = true;

        }

        protected void btnSepetTamamla_Click(object sender, EventArgs e)
        { //Musteri adres-telefon bilgilerini aldık
            projeEntities entities = new projeEntities();
            int Id = int.Parse(Session["UYEBILGISI"].ToString());
            var uye = entities.Uyelers.FirstOrDefault(x => x.ID == Id);
            uye.Adres = txtAdres.Text;
            uye.Telefon = txtTelefon.Text;
            entities.SaveChanges();
            int ToplamTutar = Convert.ToInt32(ltlToplamFiyat.Text);
            int Tutar = ToplamTutar - 9;
            string SiparisTarih = DateTime.Now.ToString("yyyy-MM-dd");
          //  int UrunNo = 0;
           // bool b = false;


            try
            {
                List<Sepet> sepet = Session["SEPET"] as List<Sepet>;
                foreach (var item in sepet)
                {
                    Siparislerim sprslerim = new Siparislerim()
                    {
                        UyeID = Id,
                        UrunID = item.UrunID,
                        Tarih = DateTime.Today,
                        SiparisDurumu = 1,
                        Tutar = Tutar,
                        KargoFirmai = 1,
                        KargoTutari = 9,
                        ToplamTutar = ToplamTutar

                    };
                    entities.Siparislerims.Add(sprslerim);
                    entities.SaveChanges();
                }
                Page.ClientScript.RegisterStartupScript(GetType(),
                      "myalert",
                      "alert('Siparişiniz başarıyla alınmıştır!');", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(),
                      "myalert",
                      "alert('Hata Oluştu!');", true);
            }
        }


    }
}