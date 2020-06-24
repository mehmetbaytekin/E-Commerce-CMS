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
    public partial class BannerYonetimi : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Goster();

        }
        void Goster()
        {
            projeEntities entities = new projeEntities();
            var data = entities.KampanyaBanners.OrderBy(x => x.bannerID).ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            string ID = hdnID.Value;
            string BannerAciklama = txtBannerAciklama.Text;
            DateTime Tarih = Convert.ToDateTime(txtTarihi.Text);
            bool aktiflik = Convert.ToBoolean(rblAktiflik.SelectedValue);
            string path = Server.MapPath("/KampanyaResimleri/");
            //string dosyaadi = FileUpload1.FileName;
            string dosyaadi = Guid.NewGuid().ToString().Replace("-", "") + ".jpg";

            FileUpload1.SaveAs(path + dosyaadi); 
            KampanyaBanner banner;
            if (ID == "0")
            {
                banner = new KampanyaBanner();
            }
            else
            {
                banner = entities.KampanyaBanners.FirstOrDefault(x => x.bannerID == int.Parse(ID));
            }
            banner.aktiflik = aktiflik;
            banner.bannerResim = dosyaadi;
            banner.bannerTarih = Tarih;
            banner.bannerAciklama = BannerAciklama;
            banner.bannerResim = FileUpload1.HasFile ? dosyaadi : string.Empty;

            if (ID == "0") entities.KampanyaBanners.Add(banner);
            entities.SaveChanges();

            hdnID.Value = "0";
            Goster();
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            LinkButton b = sender as LinkButton;
            ID = b.CommandArgument.ToString();

            hdnID.Value = ID.ToString();



           var banner = entities.KampanyaBanners.FirstOrDefault(x => x.bannerID == int.Parse(ID));
            if (banner != null)
            {
                txtBannerAciklama.Text = banner.bannerAciklama;
                txtTarihi.Text = Convert.ToDateTime(banner.bannerTarih).ToString("yyyy-MM-dd");
                bool aktif = banner.aktiflik.HasValue ? banner.aktiflik.Value : false;
                if (aktif)
                {
                    rblAktiflik.Items[0].Selected = true;
                }
                else
                {
                    rblAktiflik.Items[1].Selected = true;
                }
            }
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            hdnID.Value = "0";
            ClearTextBoxes(Page);

        }
        protected void ClearTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else if (ctrl is RadioButtonList)
                {
                    RadioButtonList t = ctrl as RadioButtonList;
                    foreach (ListItem item in t.Items)
                    {
                        item.Selected = false;
                    }


                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        ClearTextBoxes(ctrl);
                    }
                }
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            entities.KampanyaBanners.Remove(entities.KampanyaBanners.FirstOrDefault(x => x.bannerID == int.Parse(ID)));
            entities.SaveChanges();
            Goster();
        }
    }
}