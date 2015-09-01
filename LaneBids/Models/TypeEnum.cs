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

        [Display(Name = "Column Types")]
        [DescriptionAttribute("Column Types")]
        ColumnTypes = 3,

        [Display(Name = "Deck Styles")]
        [DescriptionAttribute("Deck Styles")]
        DeckStyles = 4,

        [Display(Name = "Deck Types")]
        [DescriptionAttribute("Deck Types")]
        DeckTypes = 5,

        [Display(Name = "Drainage")]
        [DescriptionAttribute("Drainage")]
        Drainage = 6,

        [Display(Name = "Facia Types")]
        [DescriptionAttribute("Facia Types")]
        FasciaTypes = 7,

        [Display(Name = "Job Types")]
        [DescriptionAttribute("Job Types")]
        JobTypes = 8,

        [Display(Name = "Scope Types")]
        [DescriptionAttribute("Scope Types")]
        ScopeTypes = 9
    }
}