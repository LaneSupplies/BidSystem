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
    
    public partial class Color
    {
        public Color()
        {
            this.Canopies = new HashSet<Canopy>();
            this.Canopies1 = new HashSet<Canopy>();
        }
    
        public int Color_ID { get; set; }
        public string Name { get; set; }
        public string ColorText { get; set; }
        public Nullable<int> Created_By { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
    
        public virtual ICollection<Canopy> Canopies { get; set; }
        public virtual ICollection<Canopy> Canopies1 { get; set; }
    }
}
