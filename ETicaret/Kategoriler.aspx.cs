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
    public partial class Kategoriler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string ID = Request.QueryString["ID"];
                //gelen Route da değiştirmek istediğmiz karakterlere müdahale ediyoruz
                if (RouteData.Values["KategoriID"] != null) { 
                    ID = RouteData.Values["KategoriID"].ToString();
                    ltlKategoriAdi.Text = RouteData.Values["KategoriAdi"].ToString().Replace('_',' ');
                }
                 

                if (ID == null) Response.Redirect("/");

                var id = Convert.ToInt32(ID.Trim());
                projeEntities entities = new projeEntities();
                var query = (from urunler in entities.Urunlers
                             join resimler in entities.UrunResimleris on urunler.ID equals resimler.UrunID
                             where resimler.Vitrin == true && urunler.UrunKategorisi == id
                             orderby urunler.ID descending
                             select new
                             {
                                 urunler.ID,
                                 urunler.UrunAdi,
                                 urunler.UrunAciklamasi,
                                 urunler.UrunFiyati,
                                 resimler.Resim
                             }).ToList();
                rptUrunler.DataSource = query;
                rptUrunler.DataBind();
            }
        }
    }
}