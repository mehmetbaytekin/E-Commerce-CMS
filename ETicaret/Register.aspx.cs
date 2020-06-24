using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaret
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            Uyeler uye = new Uyeler() {
                Email = txtRegisterEmail.Text,
                Sifre = txtRegisterPassword.Text
            };
            entities.Uyelers.Add(uye);
            entities.SaveChanges();
            Session["UYEBILGISI"] = uye.ID;

            if (Session["SEPET"] == null)
                Response.Redirect("/");
            else
                Response.Redirect("/Sepetim.aspx");
        }
    }
}