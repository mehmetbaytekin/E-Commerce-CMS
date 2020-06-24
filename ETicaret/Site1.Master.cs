using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity;

namespace ETicaret
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                projeEntities entities = new projeEntities();
                var urunkategori = entities.UrunKategorileris.OrderBy(x=> x.KategoriAdi).ToList();            
                rptKategoriler.DataSource = urunkategori;
                rptKategoriler.DataBind();

            }
            BannerGetir();

        }

        void BannerGetir()
        {
            
            projeEntities entities = new projeEntities();
            var kampanyabanner = entities.KampanyaBanners.Where(x=> x.aktiflik==true && x.bannerTarih < DbFunctions.TruncateTime(DateTime.Now)).OrderBy(x=> x.bannerID).ToList();

            rptBanner.DataSource = kampanyabanner;
            rptBanner.DataBind();
        }
    }
}