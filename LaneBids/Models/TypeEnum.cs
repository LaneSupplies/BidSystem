using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public enum TypeDataEnum : byte
    {
        [Display(Name = "Structure Type")]
        [DescriptionAttribute("Structure Type")]
        StructureType = 0,

        [Display(Name = "Bid Status")]
        [DescriptionAttribute("Bid Status")]
        BidStatus = 1,

        [Display(Name = "Bid Type")]
        [DescriptionAttribute("Bid Type")]
        BidType = 2,

        [Display(Name = "Column Shapes")]
        [DescriptionAttribute("Column Shapes")]
        ColumnShapes = 3,

        [Display(Name = "Deck Styles")]
        [DescriptionAttribute("Deck Styles")]
        DeckStyles = 4,

        [Display(Name = "Drainage")]
        [DescriptionAttribute("Drainage")]
        Drainage = 5,

        [Display(Name = "Facia Types")]
        [DescriptionAttribute("Facia Types")]
        FaciaTypes = 6,

        [Display(Name = "Job Types")]
        [DescriptionAttribute("Job Types")]
        JobTypes = 7,

        [Display(Name = "Scope Types")]
        [DescriptionAttribute("Scope Types")]
        ScopeTypes = 8
    }
}