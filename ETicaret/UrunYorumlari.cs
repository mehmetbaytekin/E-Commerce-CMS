//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ETicaret
{
    using System;
    using System.Collections.Generic;
    
    public partial class UrunYorumlari
    {
        public int ID { get; set; }
        public Nullable<int> UrunID { get; set; }
        public Nullable<System.DateTime> Tarih { get; set; }
        public Nullable<int> UyeID { get; set; }
        public string Yorum { get; set; }
        public Nullable<int> YorumDurum { get; set; }
    
        public virtual Urunler Urunler { get; set; }
    }
}
