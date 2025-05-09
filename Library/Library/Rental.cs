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
    
    public partial class Rental
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Rental()
        {
            this.Transaction = new HashSet<Transaction>();
            this.Reader1 = new HashSet<Reader>();
        }
    
        public int RentalID { get; set; }
        public int BookID { get; set; }
        public int ReaderID { get; set; }
        public int LibrarianID { get; set; }
        public Nullable<System.DateTime> LoanDate { get; set; }
        public Nullable<System.DateTime> ReturnDadte { get; set; }
        public Nullable<int> ReturnStatus { get; set; }
    
        public virtual Book Book { get; set; }
        public virtual Reader Reader { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transaction> Transaction { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reader> Reader1 { get; set; }
    }
}
