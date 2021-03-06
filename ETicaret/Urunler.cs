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
    
    public partial class Urunler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Urunler()
        {
            this.UrunYorumlaris = new HashSet<UrunYorumlari>();
        }
    
        public int ID { get; set; }
        public string UrunAdi { get; set; }
        public Nullable<int> UrunKategorisi { get; set; }
        public string UrunMarkasi { get; set; }
        public Nullable<double> UrunFiyati { get; set; }
        public Nullable<double> IndirimOrani { get; set; }
        public Nullable<double> UrunOrijinalFiyati { get; set; }
        public Nullable<double> StokMiktari { get; set; }
        public string UrunAciklamasi { get; set; }
        public Nullable<double> DegerlendirmePuani { get; set; }
        public Nullable<System.DateTime> OlusturmaTarihi { get; set; }
        public Nullable<int> Olusturan { get; set; }
        public Nullable<System.DateTime> DegisiklikTarihi { get; set; }
        public Nullable<int> Degistiren { get; set; }
        public Nullable<bool> Aktif { get; set; }
    
        public virtual UrunKategorileri UrunKategorileri { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunYorumlari> UrunYorumlaris { get; set; }
    }
}
