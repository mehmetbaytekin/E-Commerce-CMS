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
    public partial class Kategoriler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Goster();
            }            
        }

        void Goster()
        {
            projeEntities entities = new projeEntities();
            var Urunkategori = entities.UrunKategorileris.OrderBy(x => x.KategoriAdi).ToList();
            GridView1.DataSource = Urunkategori;
            GridView1.DataBind();
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            UrunKategorileri kategori = entities.UrunKategorileris.FirstOrDefault(x => x.ID == int.Parse(ID));

            if (kategori != null) {

                entities.UrunKategorileris.Remove(kategori);
                entities.SaveChanges();
            }
            Goster();
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string ID = btn.CommandArgument;
            projeEntities entities = new projeEntities();
            string kategori = entities.UrunKategorileris.FirstOrDefault(x => x.ID == int.Parse(ID)).KategoriAdi;
                txtKategoriAdi.Text = kategori;
                hdnID.Value = ID;
            
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string ID = hdnID.Value;
            string KategoriAdi = txtKategoriAdi.Text;
            projeEntities entities = new projeEntities();

            UrunKategorileri kategori;
            if (ID == "0")
            {
                kategori = new UrunKategorileri();
            }
            else
            {
                kategori = entities.UrunKategorileris.FirstOrDefault(x => x.ID == int.Parse(ID));
            }
            kategori.KategoriAdi = KategoriAdi;
          

            if (ID == "0") entities.UrunKategorileris.Add(kategori);
            entities.SaveChanges();

            hdnID.Value = "0";
            txtKategoriAdi.Text = "";

            Goster();
        }

        protected void btnYeni_Click(object sender, EventArgs e)
        {
            hdnID.Value = "0";
            txtKategoriAdi.Text = "";
        }
    }
}