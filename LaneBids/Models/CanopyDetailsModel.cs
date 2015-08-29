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
        public Guid BidId { get; set; }
        public int Quantity { get; set; }
        public int StructureId { get; set; }

        public MeasurementModel SizeHeight { get; set; }
        public MeasurementModel SizeWidth { get; set; }
        public MeasurementModel Clearance { get; set; }
        
        public int ColumnQuantity { get; set; }
        public int ColumnTypeId { get; set; }

        public MeasurementModel ColumnSize { get; set; }
        public MeasurementModel ColumnSpacingLength { get; set; }
        
        public string ColumnSpacingNotes { get; set; }
        public int DeckStyleId { get; set; }
        public int? DeckColorId { get; set; }

        public MeasurementModel DeckThickness { get; set; }
        
        public Guid? ImageId { get; set; }
        public int? ColorId { get; set; }
        public string ImagePath { get; set; }

        public MeasurementModel FasciaHeight { get; set; }
        
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
        public bool? DrawingSealed { get; set; }
        public string DrawingState { get; set; }
        public string DrawingCode { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }

        public ColumnsModel ColumnLengths { get; set; }
        public ColumnsModel ColumnWidths { get; set; }
        
        
        public IList<SelectListItem> FasciaTypeList { get; set; }

        public IList<SelectListItem> ColumnTypeList { get; set; }

        public IList<SelectListItem> ImageList { get; set; }

        public IList<SelectListItem> DeckStyleList { get; set; }

        public IList<SelectListItem> DrainageList { get; set; }

        public IList<SelectListItem> SalesPersonList { get; set; }

        public ColorModel FaciaColors { get; set; }

        
    }
}