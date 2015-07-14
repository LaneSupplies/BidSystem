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

        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult Bid(string type)
        {
            ViewBag.Title = "Bid";

            var baseBidInfo = _bidServices.BidDetailInfo(new BidDetails());
            baseBidInfo.StructureId = _bidServices.GetCanopyTypeId(type);
            
            return View(baseBidInfo);
        }

        [HttpPost]
        public ActionResult Canopy(BidDetails bidDetails)
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


            var canopyInfo = _canopyService.CanopyLoadData(bidDetails);

            return View(canopyInfo);
        }

        [HttpPost]
        public ActionResult InsertCanopy(CanopyDetails canopyDetails)
        {
            var entities = new LaneEntities();

            var clearanceHeight = new Measurement();
            clearanceHeight.Feet = canopyDetails.ClearanceFeet;
            clearanceHeight.Inches = canopyDetails.ClearanceInches;
            entities.Measurements.Add(clearanceHeight);

            var columnSize = new Measurement();
            columnSize.Feet = canopyDetails.ColumnSizeFeet;
            columnSize.Inches = canopyDetails.ColumnSizeInches;
            entities.Measurements.Add(columnSize);

            var deckThickness = new Measurement();
            deckThickness.Feet = canopyDetails.DeckThicknessFeet;
            deckThickness.Inches = canopyDetails.DeckthicknessInches;
            entities.Measurements.Add(deckThickness);

            var fasciaHeight = new Measurement();
            fasciaHeight.Feet = canopyDetails.FasciaHeightFeet;
            fasciaHeight.Inches = canopyDetails.FasciaHeightInches;
            entities.Measurements.Add(fasciaHeight);

            var sizeHeight = new Measurement();
            sizeHeight.Feet = canopyDetails.SizeHeightFeet;
            sizeHeight.Inches = canopyDetails.SizeHeightInches;
            entities.Measurements.Add(sizeHeight);

            var sizeWidth = new Measurement();
            sizeWidth.Feet = canopyDetails.SizeWidthFeet;
            sizeWidth.Inches = canopyDetails.SizeWidthInches;
            entities.Measurements.Add(sizeWidth);

            //entities.SaveChanges();
            
            var newCanopy = new Canopy();
            newCanopy.Column_Quantity = canopyDetails.Quantity;
            newCanopy.Column_Shape_ID = canopyDetails.ColumnShapeId;
            newCanopy.Column_Type_ID = canopyDetails.ColumnTypeId;
            newCanopy.Deck_Color_ID = canopyDetails.DeckColorId;
            newCanopy.Deck_Style_ID = canopyDetails.DeckStyleId;
            newCanopy.Design_Load_Notes = canopyDetails.DesignLoadNotes;
            newCanopy.Design_Load_Wind_Mph = canopyDetails.DesignLoadWindMph;
            newCanopy.Design_Load_Wind_Psf = canopyDetails.DesignLoadWindPsf;
            newCanopy.Design_Loads_Live_Psf = canopyDetails.DesignLoadsLivePsf;
            newCanopy.Drainage_Type_ID = canopyDetails.DrainageTypeId;
            newCanopy.Drawing_Code = canopyDetails.DrawingCode;
            newCanopy.Drawing_Sealed = canopyDetails.DrawingSealed;
            newCanopy.Drawing_State = canopyDetails.DrawingState;
            newCanopy.Exclusion_Notes = canopyDetails.ExclusionNotes;
            newCanopy.Inclusion_Notes = canopyDetails.InclusionNotes;
            newCanopy.Fascia_Color_ID = canopyDetails.FasciaColorId;
            newCanopy.Fascia_Type_ID = canopyDetails.FasciaTypeId;
            newCanopy.Freight_Price =  canopyDetails.FreightPrice;
            newCanopy.General_Exclusion_Notes = canopyDetails.GeneralExclusionNotes;
            newCanopy.General_Inclusion_Notes = canopyDetails.GeneralInclusionNotes;
            newCanopy.Image_ID = canopyDetails.ImageId;
            newCanopy.Labor_Price = canopyDetails.LaborPrice;
            newCanopy.Material_Price = canopyDetails.MaterialPrice;
            newCanopy.Other_Notes = canopyDetails.OtherNotes;
            newCanopy.Quantity = canopyDetails.Quantity;
            newCanopy.Tax_Price = canopyDetails.TaxPrice;
            newCanopy.Total_Price = canopyDetails.TotalPrice;

            newCanopy.Alt_Base_Price = canopyDetails.AltBasePrice;
            newCanopy.Base_Price = canopyDetails.BasePrice;

            newCanopy.Clearance_Height_Measure_ID = clearanceHeight.Measurement_ID;
            newCanopy.Column_Size_Measure_ID = columnSize.Measurement_ID;
            newCanopy.Deck_Thickness_Measure_ID = deckThickness.Measurement_ID;
            newCanopy.Fascia_Height_Measure_ID = fasciaHeight.Measurement_ID;
            newCanopy.Size_Height_Measure_ID = sizeHeight.Measurement_ID;
            newCanopy.Size_Width_Measure_ID = sizeWidth.Measurement_ID;

            //entities.SaveChanges();

            return RedirectToAction("BidSearch");
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
        public ActionResult AddCustomer(CustomerDetails customer)
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
        public ActionResult AddSalesPerson(SalesPersonDetails salesPerson)
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
        public ActionResult AddSite(SiteDetails site)
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
        public ActionResult AddShipping(ShippingInfoDetails shippingInfo)
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
