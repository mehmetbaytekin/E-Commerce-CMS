using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ETicaret
{
    public class UserType
    {
        public int ID { get; set; }
        public string Email { get; set;}
        public string Sifre { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public int Yetki { get; set; }
    }
}