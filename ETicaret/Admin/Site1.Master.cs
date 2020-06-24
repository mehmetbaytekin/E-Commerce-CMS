using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaret.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LOGIN"] == null)
                Response.Redirect("Login.aspx");
            if (Session["USER"] != null)
            {
                UserType u = Session["USER"] as UserType;
                Literal1.Text ="Hoşgeldin "+ u.Ad +" "+ u.Soyad;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Urunler.aspx");
        }
    }
}