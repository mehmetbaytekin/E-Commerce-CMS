using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace ETicaret
{
    public class Global : System.Web.HttpApplication
    {
        static int SAYAC;

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.Add(new Route("Kategori/{KategoriAdi}/{KategoriID}",
                new PageRouteHandler("~/Kategoriler.aspx")));


            RouteTable.Routes.Add(new Route("U-{UrunAdi}-{UrunID}",
                new PageRouteHandler("~/UrunDetay.aspx")));

            RouteTable.Routes.Add(new Route("UyeGirisi",
                new PageRouteHandler("~/Login.aspx")));

            RouteTable.Routes.Add(new Route("UyeOl",
               new PageRouteHandler("~/Register.aspx")));

         

            SAYAC = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            SAYAC++;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            SAYAC--;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}