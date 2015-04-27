using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public enum TypeDataEnum : byte
    {
        [Display(Name = "Structure Type")]
        StructureType = 0,

        [Display(Name = "Bid Status")]
        BidStatus = 1,

        [Display(Name = "Bid Type")]
        BidType = 2,

        [Display(Name = "Column Shapes")]
        ColumnShapes = 3,

        [Display(Name = "Deck Styles")]
        DeckStyles = 4,

        [Display(Name = "Drainage")]
        Drainage = 5,

        [Display(Name = "Facia Types")]
        FaciaTypes = 6,

        [Display(Name = "Job Types")]
        JobTypes = 7,

        [Display(Name = "Scope Types")]
        ScopeTypes = 8
    }
}