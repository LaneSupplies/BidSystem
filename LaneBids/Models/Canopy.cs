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
    
    public partial class Canopy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Canopy()
        {
            this.Bid_Canopies = new HashSet<Bid_Canopies>();
        }
    
        public System.Guid Canopy_ID { get; set; }
        public string Canopy_Code { get; set; }
        public Nullable<int> Quantity { get; set; }
        public System.Guid Size_Width_Measurement_ID { get; set; }
        public System.Guid Size_Length_Measurement_ID { get; set; }
        public System.Guid Clearance_Height_Measurement_ID { get; set; }
        public Nullable<int> Column_Quantity { get; set; }
        public Nullable<int> Column_Type_ID { get; set; }
        public string Column_Type_Other { get; set; }
        public Nullable<System.Guid> Column_Size_Length_Measurement_ID { get; set; }
        public Nullable<System.Guid> Column_Size_Width_Measurement_ID { get; set; }
        public Nullable<System.Guid> Column_Size_Thickness_Measurement_ID { get; set; }
        public Nullable<System.Guid> Column_Size_OD_Measurement_ID { get; set; }
        public string Column_Size_Other { get; set; }
        public string Column_Spacing_Notes { get; set; }
        public Nullable<int> Deck_Style_ID { get; set; }
        public Nullable<int> Deck_Type_ID { get; set; }
        public Nullable<int> Deck_Color_ID { get; set; }
        public Nullable<System.Guid> Deck_Thickness_Measurement_ID { get; set; }
        public Nullable<int> Deck_Gauge { get; set; }
        public Nullable<System.Guid> Image_ID { get; set; }
        public Nullable<System.Guid> Fascia_Image_ID { get; set; }
        public Nullable<System.Guid> Fascia_Height_Measurement_ID { get; set; }
        public Nullable<int> Fascia_Type_ID { get; set; }
        public Nullable<int> Fascia_Color_ID { get; set; }
        public string Fascia_Info { get; set; }
        public Nullable<System.Guid> Facia_Thickness_Measurement_ID { get; set; }
        public Nullable<int> Drainage_Type_ID { get; set; }
        public Nullable<System.Guid> Drainage_Measurement_ID { get; set; }
        public string Other_Notes { get; set; }
        public string Inclusion_Notes { get; set; }
        public string Exclusion_Notes { get; set; }
        public string General_Inclusion_Notes { get; set; }
        public string General_Exclusion_Notes { get; set; }
        public Nullable<decimal> Base_Price { get; set; }
        public Nullable<decimal> Material_Price { get; set; }
        public Nullable<decimal> Labor_Price { get; set; }
        public Nullable<decimal> Freight_Price { get; set; }
        public Nullable<decimal> Tax_Price { get; set; }
        public Nullable<decimal> Total_Price { get; set; }
        public Nullable<decimal> Alt_Base_Price { get; set; }
        public Nullable<int> Design_Loads_Live_Psf { get; set; }
        public Nullable<int> Design_Load_Wind_Mph { get; set; }
        public Nullable<int> Design_Load_Wind_Psf { get; set; }
        public string Design_Load_Snow { get; set; }
        public string Design_Load_Spec { get; set; }
        public string Design_Load_Notes { get; set; }
        public Nullable<bool> Drawing_Sealed { get; set; }
        public string Design_Specs { get; set; }
        public Nullable<bool> Has_Perimeter_Gutters { get; set; }
        public Nullable<bool> Has_Center_Gutters { get; set; }
        public Nullable<bool> Has_Internal_Gutters { get; set; }
        public Nullable<bool> Has_External_Gutters { get; set; }
        public Nullable<bool> Has_Scruppers { get; set; }
        public string Gutter_Notes { get; set; }
        public string Drawing_State { get; set; }
        public string Drawing_Code { get; set; }
        public Nullable<int> Created_By { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public Nullable<int> Modified_By { get; set; }
        public Nullable<System.DateTime> Modifed_Date { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bid_Canopies> Bid_Canopies { get; set; }
        public virtual Image Image { get; set; }
        public virtual Measurement Measurement { get; set; }
        public virtual Measurement Measurement1 { get; set; }
        public virtual Measurement Measurement2 { get; set; }
        public virtual Measurement Measurement3 { get; set; }
        public virtual Measurement Measurement4 { get; set; }
        public virtual Measurement Measurement5 { get; set; }
        public virtual Measurement Measurement6 { get; set; }
        public virtual Measurement Measurement7 { get; set; }
        public virtual Measurement Measurement8 { get; set; }
        public virtual Measurement Measurement9 { get; set; }
        public virtual Color Color { get; set; }
        public virtual Color Color1 { get; set; }
        public virtual Column_Types Column_Types { get; set; }
        public virtual Deck_Styles Deck_Styles { get; set; }
        public virtual Deck_Types Deck_Types { get; set; }
        public virtual Measurement Measurement10 { get; set; }
        public virtual Drainage_Types Drainage_Types { get; set; }
        public virtual Measurement Measurement11 { get; set; }
        public virtual Fascia_Types Fascia_Types { get; set; }
        public virtual Image Image1 { get; set; }
    }
}
