using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ETicaret
{
    public class Sepet
    {
        //{   public string Resim { get; set; }
        public int UrunID { get; set; }
        public string Marka { get; set; }
        public string UrunAdi { get; set; }
        public int Miktar { get; set; }

        public double Fiyat { get; set; }
    }
}