//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reader
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reader()
        {
            this.Rental1 = new HashSet<Rental>();
        }
    
        public int ReaderID { get; set; }
        public string FullName { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
        public string Adress { get; set; }
        public string Phone { get; set; }
        public Nullable<decimal> PenaltyAmount { get; set; }
    
        public virtual Rental Rental { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rental> Rental1 { get; set; }
    }
}
