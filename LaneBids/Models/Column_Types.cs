//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LaneBids.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Column_Types
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Column_Types()
        {
            this.Canopies = new HashSet<Canopy>();
        }
    
        public int Column_Type_ID { get; set; }
        public string Name { get; set; }
        public Nullable<int> Created_By { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Canopy> Canopies { get; set; }
    }
}
