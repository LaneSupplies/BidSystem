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
    
    public partial class Bid_Statuses
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bid_Statuses()
        {
            this.Bids = new HashSet<Bid>();
        }
    
        public int Bid_Status_ID { get; set; }
        public string Status { get; set; }
        public Nullable<int> Created_By { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bid> Bids { get; set; }
    }
}
