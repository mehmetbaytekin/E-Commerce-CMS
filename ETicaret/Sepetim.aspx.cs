using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETicaret
{
    public partial class Sepetim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SEPET"] == null)
                Response.Redirect("/");

            if(!IsPostBack)
            {
                List<Sepet> sepet = Session["SEPET"] as List<Sepet>;
                

                grdSepet.DataSource = sepet;
                grdSepet.DataBind();
            }
        }

        protected void btnTamamla_Click(object sender, EventArgs e)
        {
            if (Session["UYEBILGISI"] == null)
            {
                Response.Redirect("/UyeGirisi");
            }
            else
            {
                Response.Redirect("/satinal.aspx");
            }
        }
    }
}