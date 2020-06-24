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
    public partial class Login : System.Web.UI.Page
    {
        string KullaniciAdi;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Session["LOGIN"] = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();

            if (entities.Kullanicilars.Any(x => x.Email == TextBox1.Text && x.sifre == TextBox2.Text) == true)
            {
                var res = (from kullanici in entities.Kullanicilars
                                 where kullanici.Email == TextBox1.Text && kullanici.sifre == TextBox2.Text
                                 select new
                                 {
                                     kullanici.ID,
                                     kullanici.Ad,
                                     kullanici.Soyad,
                                     kullanici.Email,
                                 }).FirstOrDefault();
                Session["LOGIN"] = true;
                Session["USERNAME"] = res.Email;

                UserType u = new UserType();
                u.ID = res.ID;
                u.Email = res.Email;
                u.Ad = res.Ad;
                u.Soyad = res.Soyad;

                Session["USER"] = u;

                Response.Redirect("default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();

            if (entities.Kullanicilars.Any(x => x.Email == TextBox1.Text && x.sifre == TextBox2.Text) == true)
            {
                var res = (from kullanici in entities.Kullanicilars
                           where kullanici.Email == TextBox1.Text && kullanici.sifre == TextBox2.Text
                           select new
                           {
                               kullanici.ID,
                               kullanici.Ad,
                               kullanici.Soyad,
                               kullanici.Email,
                           }).FirstOrDefault();
                UserType u = new UserType();
                u.ID = res.ID;
                u.Email = res.Email;
                u.Ad = res.Ad;
                u.Soyad = res.Soyad;

                Session["USER"] = u;

                Response.Redirect("default.aspx");
            }
        }
    }
}