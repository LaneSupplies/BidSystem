using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class CanopyDetails
    {
        public Int32 CanopyId { get; set; }
        public Int32 BidId { get; set; }
        public string BidFunctionType { get; set; }
        public Int32 Quantity { get; set; }
        public Int32 StructureId { get; set; }
        public Int32 SizeHeightFeet { get; set; }
        public Int32 SizeHeightInches { get; set; }
        public Int32 SizeWidthFeet { get; set; }
        public Int32 SizeWidthInches { get; set; }
        public Int32 ClearanceFeet { get; set; }
        public Int32 ClearanceInches { get; set; }
        public Int32 ColumnQuantity { get; set; }
        public Int32 ColumnTypeId { get; set; }
        public Int32 ColumnSizeFeet { get; set; }
        public Int32 ColumnSizeInches { get; set; }
        public Int32 ColumnSpacingLength { get; set; }
        public Int32 ColumnShapeId { get; set; }
        public Int32 ColumnSpacingLengthFeet { get; set; }
        public Int32 ColumnSpacingLengthInches { get; set; }
        public Int32 ColumnSpacingWidthFeet { get; set; }
        public Int32 ColumnSpacingWidthInches { get; set; }
        public String ColumnSpacingNotes { get; set; }
        public Int32 DeckStyleId { get; set; }
        public Int32 DeckColorId { get; set; }
        public Int32 DeckThicknessFeet { get; set; }
        public Int32 DeckthicknessInches { get; set; }
        public Int32 ImageId { get; set; }
        public Int32 ColorId { get; set; }
        public String ImagePath { get; set; }
        public Int32 FasciaHeightFeet { get; set; }
        public Int32 FasciaHeightInches { get; set; }
        public Int32 FasciaTypeId { get; set; }
        public Int32 FasciaColorId { get; set; }
        public Int32 DrainageTypeId { get; set; }
        public String OtherNotes { get; set; }
        public String InclusionNotes { get; set; }
        public String ExclusionNotes { get; set; }
        public String GeneralInclusionNotes { get; set; }
        public String GeneralExclusionNotes { get; set; }
        public Decimal? BasePrice { get; set; }
        public Decimal? MaterialPrice { get; set; }
        public Decimal? LaborPrice { get; set; }
        public Decimal? FreightPrice { get; set; }
        public Decimal? TaxPrice { get; set; }
        public Decimal? TotalPrice { get; set; }
        public Decimal? AltBasePrice { get; set; }
        public Int32 DesignLoadsLivePsf { get; set; }
        public Int32 DesignLoadWindMph { get; set; }
        public Int32 DesignLoadWindPsf { get; set; }
        public String DesignLoadNotes { get; set; }
        public String DrawingSealed { get; set; }
        public String DrawingState { get; set; }
        public String DrawingCode { get; set; }
        public String CreatedBy { get; set; }
        public String ModifiedBy { get; set; }
        
        public IList<SelectListItem> ColumnShapeList { get; set; }

        public IList<SelectListItem> FasciaTypeList { get; set; }

        public IList<SelectListItem> ColumnTypeList { get; set; }

        public IList<SelectListItem> ImageList { get; set; }

        public IList<SelectListItem> DeckStyleList { get; set; }

        public IList<SelectListItem> DrainageList { get; set; }

        public IList<SelectListItem> SalesPersonList { get; set; }

        public ColorModel FaciaColors { get; set; }
    }
}