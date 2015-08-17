using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class CanopyDetailsModel
    {
        public int CanopyId { get; set; }
        public int BidId { get; set; }
        public int Quantity { get; set; }
        public int StructureId { get; set; }
        public int SizeHeightFeet { get; set; }
        public int SizeHeightInches { get; set; }
        public int SizeWidthFeet { get; set; }
        public int SizeWidthInches { get; set; }
        public int ClearanceFeet { get; set; }
        public int ClearanceInches { get; set; }
        public int ColumnQuantity { get; set; }
        public int ColumnTypeId { get; set; }
        public int ColumnSizeFeet { get; set; }
        public int ColumnSizeInches { get; set; }
        public int ColumnSpacingLength { get; set; }
        public string ColumnSpacingNotes { get; set; }
        public int DeckStyleId { get; set; }
        public int? DeckColorId { get; set; }
        public int DeckThicknessFeet { get; set; }
        public int DeckthicknessInches { get; set; }
        public int ImageId { get; set; }
        public int? ColorId { get; set; }
        public string ImagePath { get; set; }
        public int FasciaHeightFeet { get; set; }
        public int FasciaHeightInches { get; set; }
        public int FasciaTypeId { get; set; }
        public int? FasciaColorId { get; set; }
        public int DrainageTypeId { get; set; }
        public string OtherNotes { get; set; }
        public string InclusionNotes { get; set; }
        public string ExclusionNotes { get; set; }
        public string GeneralInclusionNotes { get; set; }
        public string GeneralExclusionNotes { get; set; }
        public decimal? BasePrice { get; set; }
        public decimal? MaterialPrice { get; set; }
        public decimal? LaborPrice { get; set; }
        public decimal? FreightPrice { get; set; }
        public decimal? TaxPrice { get; set; }
        public decimal? TotalPrice { get; set; }
        public decimal? AltBasePrice { get; set; }
        public int DesignLoadsLivePsf { get; set; }
        public int DesignLoadWindMph { get; set; }
        public int DesignLoadWindPsf { get; set; }
        public string DesignLoadNotes { get; set; }
        public string DrawingSealed { get; set; }
        public string DrawingState { get; set; }
        public string DrawingCode { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }

        public ColumnLengthModel ColumnLengths { get; set; }
        public ColumnLengthModel ColumnWidths { get; set; }
        
        
        public IList<SelectListItem> FasciaTypeList { get; set; }

        public IList<SelectListItem> ColumnTypeList { get; set; }

        public IList<SelectListItem> ImageList { get; set; }

        public IList<SelectListItem> DeckStyleList { get; set; }

        public IList<SelectListItem> DrainageList { get; set; }

        public IList<SelectListItem> SalesPersonList { get; set; }

        public ColorModel FaciaColors { get; set; }

        
    }
}