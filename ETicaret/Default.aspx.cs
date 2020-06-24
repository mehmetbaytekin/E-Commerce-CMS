using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;


namespace ETicaret
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Master.FindControl("pnlSlider").Visible = true;
            if (!IsPostBack)
            {
                projeEntities entities = new projeEntities();
                var query = (from urunler in entities.Urunlers
                             join resimler in entities.UrunResimleris on urunler.ID equals resimler.UrunID
                             where resimler.Vitrin == true
                             orderby urunler.ID descending
                             select new
                             {
                                 urunler.ID,
                                 urunler.UrunAdi,
                                 urunler.UrunAciklamasi,
                                 urunler.UrunFiyati,
                                 resimler.Resim
                             }).Take(9).ToList();
                RptVitrin.DataSource = query;
                RptVitrin.DataBind();
            }
        }
    }
}