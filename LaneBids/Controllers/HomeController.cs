using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using System.Web.Security;
using LaneBids.Models;
using LaneBids.Sources;
using Microsoft.Ajax.Utilities;
using WebMatrix.WebData;

namespace LaneBids.Controllers
{
    public class HomeController : Controller
    {
        private BidServices _bidServices = new BidServices();
        private CanopyServices _canopyService = new CanopyServices();
        private CommonServices _commonServices = new CommonServices();
        private HomeServices _homeServices = new HomeServices();

        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult Bid(string type)
        {
            ViewBag.Title = "Bid";

            var baseBidInfo = _bidServices.BidDetailInfo(new BidDetailsModel());
            baseBidInfo.StructureId = _bidServices.GetCanopyTypeId(type);
            
            return View(baseBidInfo);
        }

        [HttpPost]
        public ActionResult Canopy(BidDetailsModel bidDetails)
        {
            ViewBag.Title = "Canopy";
            if (!ModelState.IsValid)
            {
                bidDetails = _bidServices.BidDetailInfo(bidDetails);
                return View("Bid", bidDetails);
            }
            
            var entities = new LaneEntities();
            var bidNotes = new List<Bid_Notes>();
            if (!String.IsNullOrEmpty(bidDetails.BidNotesText))
            {
                var bidNote = new Bid_Notes
                {
                    Notes = bidDetails.BidNotesText,
                    Create_Date = DateTime.Now,
                    Created_By = WebSecurity.CurrentUserId
                };
                entities.Bid_Notes.Add(bidNote);
                entities.SaveChanges();

                bidNotes.Add(bidNote);
            }

            var newBid = new Bid
            {
                Bid_Status_ID = bidDetails.BidStatusId,
                Bid_Type_ID = bidDetails.BidTypeId,
                Scope_Type_ID = bidDetails.ScopeTypeId,
                Job_Type_ID = bidDetails.JobTypeId,
                Structure_Type_ID = bidDetails.StructureId,
                Customer_ID = bidDetails.CustomerId,
                Sales_Person_ID = bidDetails.SalesPersonId,
                Shipping_ID = bidDetails.ShippingId,
                Site_ID = bidDetails.SiteId,
                Created_By = WebSecurity.CurrentUserId,
                Create_Date = DateTime.Now,
                Bid_Notes = bidNotes
            };

            entities.Bids.Add(newBid);
            entities.SaveChanges();

            

            bidDetails.BidId = newBid.Bid_ID;
            var canopyInfo = _canopyService.CanopyLoadData(bidDetails);

            return View(canopyInfo);
        }

        [HttpPost]
        public ActionResult InsertCanopy(CanopyDetailsModel canopyDetails)
        {
            var entities = new LaneEntities();

            var clearanceHeight = _commonServices.GetMeasurementId(canopyDetails.Clearance);
            var columnSize = _commonServices.GetMeasurementId(canopyDetails.ColumnSize);
            var deckThickness = _commonServices.GetMeasurementId(canopyDetails.DeckThickness);
            var fasciaHeight = _commonServices.GetMeasurementId(canopyDetails.FasciaHeight);
            var sizeHeight = _commonServices.GetMeasurementId(canopyDetails.SizeHeight);
            var sizeWidth = _commonServices.GetMeasurementId(canopyDetails.SizeWidth);
            var bids = entities.Bid_Canopies.Where(x => x.Bid_ID == canopyDetails.BidId).ToList();

            var newCanopy = new Canopy
            {
                Bid_Canopies = bids,
                Column_Quantity = canopyDetails.Quantity,
                Column_Type_ID = canopyDetails.ColumnTypeId,
                Deck_Color_ID = canopyDetails.DeckColorId,
                Deck_Style_ID = canopyDetails.DeckStyleId,
                Design_Load_Notes = canopyDetails.DesignLoadNotes,
                Design_Load_Wind_Mph = canopyDetails.DesignLoadWindMph,
                Design_Load_Wind_Psf = canopyDetails.DesignLoadWindPsf,
                Design_Loads_Live_Psf = canopyDetails.DesignLoadsLivePsf,
                Drainage_Type_ID = canopyDetails.DrainageTypeId,
                Drawing_Code = canopyDetails.DrawingCode,
                Drawing_Sealed = canopyDetails.DrawingSealed,
                Drawing_State = canopyDetails.DrawingState,
                Exclusion_Notes = canopyDetails.ExclusionNotes,
                Inclusion_Notes = canopyDetails.InclusionNotes,
                Fascia_Color_ID = canopyDetails.FasciaColorId,
                Fascia_Type_ID = canopyDetails.FasciaTypeId,
                Freight_Price = canopyDetails.FreightPrice,
                General_Exclusion_Notes = canopyDetails.GeneralExclusionNotes,
                General_Inclusion_Notes = canopyDetails.GeneralInclusionNotes,
                Image_ID = canopyDetails.ImageId,
                Labor_Price = canopyDetails.LaborPrice,
                Material_Price = canopyDetails.MaterialPrice,
                Other_Notes = canopyDetails.OtherNotes,
                Quantity = canopyDetails.Quantity,
                Tax_Price = canopyDetails.TaxPrice,
                Total_Price = canopyDetails.TotalPrice,
                Alt_Base_Price = canopyDetails.AltBasePrice,
                Base_Price = canopyDetails.BasePrice,
                Clearance_Height_Measurement_ID = clearanceHeight,
                Deck_Thickness_Measurement_ID = deckThickness,
                Fascia_Height_Measurement_ID = fasciaHeight,
                Size_Length_Measurement_ID = sizeHeight,
                Size_Width_Measurement_ID = sizeWidth,
                Created_By = WebSecurity.CurrentUserId,
                Create_Date = DateTime.Now,
                ///////////////////////////////////////
                Column_Size_Length_Measurement_ID = columnSize,
                Column_Size_OD_Measurement_ID = Guid.Empty,
                Column_Size_Other = string.Empty,
                Column_Size_Thickness_Measurement_ID = Guid.Empty,
                Column_Size_Width_Measurement_ID = Guid.Empty,
                Column_Spacing_Notes = string.Empty,
                Column_Type_Other = string.Empty,
                Deck_Gauge = 0,
                Deck_Type_ID = 0,
                Design_Load_Snow = string.Empty,
                Design_Load_Spec = string.Empty,
                Design_Specs = string.Empty,
                Drainage_Measurement_ID = Guid.Empty,
                Facia_Thickness_Measurement_ID = Guid.Empty,
                Fascia_Image_ID = Guid.Empty,
                Fascia_Info = string.Empty,
                Gutter_Notes = string.Empty,
                Has_Center_Gutters = false,
                Has_External_Gutters = false,
                Has_Internal_Gutters = false,
                Has_Perimeter_Gutters = false,
                Has_Scruppers = false,
            };

            entities.Canopies.Add(newCanopy);
            entities.SaveChanges();

            foreach (var measurement in canopyDetails.ColumnLengths.measurements)
            {
                var newColLength = new Column_Spacing_Lengths
                {
                    Measurement_ID = _commonServices.GetMeasurementId(measurement),
                    Canopy_ID = newCanopy.Canopy_ID
                };
                entities.Column_Spacing_Lengths.Add(newColLength);
            }

            foreach (var measurement in canopyDetails.ColumnWidths.measurements)
            {
                var newColWidth = new Column_Spacing_Widths
                {
                    Measurement_ID = _commonServices.GetMeasurementId(measurement),
                    Canopy_ID = newCanopy.Canopy_ID
                };
                entities.Column_Spacing_Widths.Add(newColWidth);
            }

            entities.SaveChanges();
            return Content("Success");
        }

        public ActionResult BidSearch(string type)
        {
            var services = new BidServices();
            var searchBaseData = services.SearchBaseData(type);

            return View(searchBaseData);
        }

        [HttpPost]
        public ActionResult BidSearch(BidSearchModel searchModel)
        {
            var entities = new LaneEntities();
            var services = new BidServices();
            var searchData = services.SearchBaseData(searchModel.StructureTypeId.ToString());

            var sqlString = String.Format("exec BidSearch '{0}', '{1}', '{2}', '{3}', '{4}'", searchModel.BidId,
                searchModel.BidStatusId, searchModel.BidTypeId, searchModel.JobTypeId, searchModel.SiteId);
            searchData.SearchResultsList = entities.Database.SqlQuery<BidSearch_Result>(sqlString).ToList();

            return View(searchData);
        }

        #region Home AJAX calls

        [HttpGet]
        public JsonResult ContactList()
        {
            var entities = new LaneEntities();
            var contactList = entities.Contact_Types.Select(s => new
            {
                Id = s.Contact_Type_ID,
                s.Name
            });
            return Json(contactList, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public JsonResult StateList()
        {
            return Json(AddressService.States, JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        public JsonResult AddSite(SiteDetailsModel site)
        {
            var newSite = _homeServices.SaveSite(site);

            return Json(newSite);
        }

        [HttpPost]
        public ActionResult AddShipping(ShippingInfoDetailsModel shippingInfo)
        {
            var entities = new LaneEntities();
            var addAddress = new Address();
            addAddress.Address_Line1 = shippingInfo.AddressLine1;
            addAddress.Address_Line2 = shippingInfo.AddressLine2;
            addAddress.City = shippingInfo.City;
            addAddress.State = shippingInfo.State;
            addAddress.Zip = shippingInfo.Zip;
            entities.Addresses.Add(addAddress);
            entities.SaveChanges();

            var newShipping = new Shipping_Info();
            newShipping.Name = shippingInfo.ShippingName;
            newShipping.Address_ID = addAddress.Address_ID;
            entities.Shipping_Info.Add(newShipping);
            entities.SaveChanges();

            return Content(newShipping.Shipping_ID + "|" + newShipping.Name);
        }

        [HttpPost]
        public ActionResult ColorAdd(ColorModel color)
        {
            var entities = new LaneEntities();
            var addColor = new Color
            {
                Name = color.ColorName,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId
            };

            entities.Colors.Add(addColor);
            entities.SaveChanges();

            return Content(addColor.Color_ID + "|" + addColor.Name);
        }

        #endregion

    }
}
