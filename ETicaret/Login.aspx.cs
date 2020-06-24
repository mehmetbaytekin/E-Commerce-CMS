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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            projeEntities entities = new projeEntities();
            

            if(entities.Uyelers.Any(x=> x.Email == txtLoginEmail.Text && x.Sifre == txtLoginPassword.Text) == true)
            {
                var ID = entities.Uyelers.FirstOrDefault(x => x.Email == txtLoginEmail.Text && x.Sifre == txtLoginPassword.Text).ID;
                Session["UYEBILGISI"] = ID.ToString();

                if (Session["SEPET"] == null)
                    Response.Redirect("/");
                else
                    Response.Redirect("/Sepetim.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "myalert",
                "alert('Kullanıcı bilgisi bulunamamıştır!');", true);
            }

     /*       string sql = @"
select * from Uyeler
where Email=@Email and Sifre=@Sifre
";
            SqlParameter[] prm = new SqlParameter[]
            {
                new SqlParameter("Email", txtLoginEmail.Text),
                new SqlParameter("Sifre", txtLoginPassword.Text)
            };

            DataRow dr = Helper.GetDataRow(sql, prm);

            if (dr != null)
            {
                Session["UYEBILGISI"] = dr["ID"].ToString();

                if (Session["SEPET"] == null)
                    Response.Redirect("/");
                else
                    Response.Redirect("/Sepetim.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), 
                    "myalert", 
                    "alert('Kullanıcı bilgisi bulunamamıştır!');", true);
            }*/
        }

        
    }
}