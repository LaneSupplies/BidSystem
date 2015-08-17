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
                Create_Date = DateTime.Now
            };

            entities.Bids.Add(newBid);
            entities.SaveChanges();

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

                newBid.Bid_Note_ID = bidNote.Bid_Note_ID;
                entities.SaveChanges();
            }

            bidDetails.BidId = newBid.Bid_ID;
            var canopyInfo = _canopyService.CanopyLoadData(bidDetails);

            return View(canopyInfo);
        }

        [HttpPost]
        public ActionResult InsertCanopy(CanopyDetailsModel canopyDetails)
        {
            var entities = new LaneEntities();

            var clearanceHeight = _commonServices.MeasurementId(canopyDetails.ClearanceFeet, canopyDetails.ClearanceInches);
            var columnSize = _commonServices.MeasurementId(canopyDetails.ColumnSizeFeet, canopyDetails.ColumnSizeInches);
            var deckThickness = _commonServices.MeasurementId(canopyDetails.DeckThicknessFeet, canopyDetails.DeckthicknessInches);
            var fasciaHeight = _commonServices.MeasurementId(canopyDetails.FasciaHeightFeet, canopyDetails.FasciaHeightInches);
            var sizeHeight = _commonServices.MeasurementId(canopyDetails.SizeHeightFeet, canopyDetails.SizeHeightInches);
            var sizeWidth = _commonServices.MeasurementId(canopyDetails.SizeWidthFeet, canopyDetails.SizeWidthInches);
            var bids = entities.Bids.Where(x => x.Bid_ID == canopyDetails.BidId).ToList();

            var newCanopy = new Canopy
            {
                Bids = bids,
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
                Clearance_Height_Measure_ID = clearanceHeight,
                Column_Size_Measure_ID = columnSize,
                Deck_Thickness_Measure_ID = deckThickness,
                Fascia_Height_Measure_ID = fasciaHeight,
                Size_Length_Measure_ID = sizeHeight,
                Size_Width_Measure_ID = sizeWidth,
                Created_By = WebSecurity.CurrentUserId,
                Create_Date = DateTime.Now
            };

            entities.Canopies.Add(newCanopy);
            entities.SaveChanges();

            foreach (var measurement in canopyDetails.ColumnLengths.measurements)
            {
                var newColLength = new Column_Spacing_Lengths
                {
                    Measurement_ID = _commonServices.MeasurementId(measurement.feet, measurement.inches),
                    Canopy_ID = newCanopy.Canopy_ID
                };
                entities.Column_Spacing_Lengths.Add(newColLength);
            }

            foreach (var measurement in canopyDetails.ColumnWidths.measurements)
            {
                var newColWidth = new Column_Spacing_Widths
                {
                    Measurement_ID = _commonServices.MeasurementId(measurement.feet, measurement.inches),
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
        public ActionResult AddCustomer(CustomerDetailsModel customer)
        {
            var entities = new LaneEntities();
            var addAddress = new Address
            {
                Address_Line1 = customer.AddressLine1,
                Address_Line2 = customer.AddressLine2,
                City = customer.City,
                State = customer.State,
                Zip = customer.Zip
            };
            entities.Addresses.Add(addAddress);
            entities.SaveChanges();

            var contact = new Contact_Info
            {
                Contact_Text = customer.PhoneNumber,
                Contact_Type_ID = customer.ContactId,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId,
            };
            entities.Contact_Info.Add(contact);
            entities.SaveChanges();

            var newCustomer = new Customer
            {
                First_Name = customer.FirstName,
                Last_Name = customer.LastName,
                Email = customer.Email,
                Company_Name = customer.CompanyName,
                Address_ID = addAddress.Address_ID,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId
            };
            entities.Customers.Add(newCustomer);
            entities.SaveChanges();

            return Content(newCustomer.Customer_ID + "|" + customer.FirstName + " " + customer.LastName);
        }

        [HttpPost]
        public ActionResult AddSalesPerson(SalesPersonDetailsModel salesPerson)
        {
            var entities = new LaneEntities();
            var addAddress = new Address
            {
                Address_Line1 = salesPerson.AddressLine1,
                Address_Line2 = salesPerson.AddressLine2,
                City = salesPerson.City,
                State = salesPerson.State,
                Zip = salesPerson.Zip
            };
            entities.Addresses.Add(addAddress);
            entities.SaveChanges();

            var newSalesPerson = new Sales_Persons
            {
                First_Name = salesPerson.FirstName,
                Last_Name = salesPerson.LastName,
                Address_ID = addAddress.Address_ID,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId
            };
            entities.Sales_Persons.Add(newSalesPerson);
            entities.SaveChanges();

            var contact = new Contact_Info
            {
                Contact_Text = salesPerson.PhoneNumber,
                Contact_Type_ID = salesPerson.ContactId,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId
            };
            entities.Contact_Info.Add(contact);
            entities.SaveChanges();
            
            return Content(newSalesPerson.Sales_Person_ID + "|" + newSalesPerson.First_Name + " " + newSalesPerson.Last_Name);
        }

        [HttpPost]
        public ActionResult AddSite(SiteDetailsModel site)
        {
            var entities = new LaneEntities();
            var addAddress = new Address();
            addAddress.Address_Line1 = site.AddressLine1;
            addAddress.Address_Line2 = site.AddressLine2;
            addAddress.City = site.City;
            addAddress.State = site.State;
            addAddress.Zip = site.Zip;
            entities.Addresses.Add(addAddress);
            entities.SaveChanges();

            var newSite = new Site();
            newSite.Name = site.SiteName;
            newSite.Address_ID = addAddress.Address_ID;
            newSite.Create_Date = DateTime.Now;
            newSite.Created_By = WebSecurity.CurrentUserId;
            entities.Sites.Add(newSite);
            entities.SaveChanges();
            
            return Content(newSite.Site_ID + "|" + newSite.Name);
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
                ColorText = color.ColorText,
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
