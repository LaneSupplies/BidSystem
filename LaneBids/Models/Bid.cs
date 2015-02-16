//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LaneBids.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Bid
    {
        public Bid()
        {
            this.Canopies = new HashSet<Canopy>();
            this.Bid_Notes = new HashSet<Bid_Notes>();
        }
    
        public int Bid_ID { get; set; }
        public int Revision_Number { get; set; }
        public int Structure_Type_ID { get; set; }
        public int Bid_Status_ID { get; set; }
        public int Job_Type_ID { get; set; }
        public int Scope_Type_ID { get; set; }
        public int Bid_Type_ID { get; set; }
        public Nullable<System.Guid> Customer_ID { get; set; }
        public int Sales_Person_ID { get; set; }
        public Nullable<int> Site_ID { get; set; }
        public int Shipping_ID { get; set; }
        public int Bid_Note_ID { get; set; }
        public int Canopy_ID { get; set; }
        public int Created_By { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public Nullable<int> Modifed_By { get; set; }
        public Nullable<System.DateTime> Modified_Date { get; set; }
    
        public virtual Bid_Statuses Bid_Statuses { get; set; }
        public virtual Bid_Types Bid_Types { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Job_Types Job_Types { get; set; }
        public virtual Sales_Persons Sales_Persons { get; set; }
        public virtual Scope_Types Scope_Types { get; set; }
        public virtual Shipping_Info Shipping_Info { get; set; }
        public virtual Site Site { get; set; }
        public virtual Structure_Types Structure_Types { get; set; }
        public virtual ICollection<Canopy> Canopies { get; set; }
        public virtual ICollection<Bid_Notes> Bid_Notes { get; set; }
    }
}
