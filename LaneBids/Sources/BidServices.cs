using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaneBids.Models;

namespace LaneBids.Sources
{
    public class BidServices
    {
        public static int GetCanopyTypeId(string CanopyType)
        {
            var entities = new LaneEntities();
            var bidType = entities.Structure_Types.FirstOrDefault(x => x.Name == CanopyType);
            return bidType != null ? bidType.Structure_Type_ID : 0;
        }

        public BidDetails BidDetailInfo(string canopyType)
        {
            var entities = new LaneEntities();
            var bid = new BidDetails();
            bid.StructureId = GetCanopyTypeId(canopyType);

            bid.StructureList = entities.Structure_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Structure_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            
            bid.BidTypeList = entities.Bid_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Bid_Type_ID.ToString(),
                Text = x.Name
            }).ToList();

            bid.BidStatusList = entities.Bid_Statuses.ToList().Select(x => new SelectListItem
            {
                Value = x.Bid_Status_ID.ToString(),
                Text = x.Status
            }).ToList();

            bid.JobTypeList = entities.Job_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Job_Type_ID.ToString(),
                Text = x.Name
            }).ToList();

            bid.ScopeTypeList = entities.Scope_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Scope_Type_ID.ToString(),
                Text = x.Name
            }).ToList();

            bid.AddressesList = entities.Addresses.ToList().Select(x => new SelectListItem
            {
                Value = x.Address_ID.ToString(),
                Text = x.Address_Line1 + " , " + x.City + " , " + x.State + " " + x.Zip
            }).ToList();

            bid.ShippingList = entities.Addresses.ToList().Select(x => new SelectListItem
            {
                Value = x.Address_ID.ToString(),
                Text = x.Address_Line1 + " , " + x.City + " , " + x.State + " " + x.Zip
            }).ToList();

            bid.SiteList = entities.Sites.ToList().Select(x => new SelectListItem
            {
                Value = x.Site_ID.ToString(),
                Text = x.Name
            }).ToList();

            //Contact Types
            var contactTypeList = entities.Contact_Types.ToList().Select(s => new SelectListItem
            {
                Value = s.Contact_Type_ID.ToString(),
                Text = s.Name
            });

            //Customer Data
            bid.AddCustomerInfo = new CustomerDetails
            {
                Address = new AddressModel {StateList = AddressService.States},
                PhoneContacts = new PhoneContacts {ContactTypeList = contactTypeList},
                CustomerList = entities.Customers.OrderBy(x => x.Last_Name).ToList().Select(x => new SelectListItem
                {
                    Value = x.Customer_ID.ToString(),
                    Text = x.First_Name + " " + x.Last_Name
                }).ToList()
            };

            //Sales Person Data
            bid.AddSalesPersonDetails = new SalesPersonDetails
            {
                Address = new AddressModel {StateList = AddressService.States},
                PhoneContacts = new PhoneContacts {ContactTypeList = contactTypeList},
                SalesPersonList = entities.Sales_Persons.ToList().Select(x => new SelectListItem
                {
                    Value = x.Sales_Person_ID.ToString(),
                    Text = x.First_Name + " " + x.Last_Name
                }).ToList()
            };

            //Sites
            bid.AddSiteDetails = new SiteDetails
            {
                Address = new AddressModel {StateList = AddressService.States},
                SiteList = entities.Sites.ToList().Select(x => new SelectListItem
                {
                    Value = x.Site_ID.ToString(),
                    Text = x.Name
                }).ToList()
            };

            //Shipping Info
            bid.AddShippingInfoDetails = new ShippingInfoDetails
            {
                StateList = AddressService.States,
                ShippingList = entities.Shipping_Info.ToList().Select(x => new SelectListItem
                {
                    Value = x.Shipping_ID.ToString(),
                    Text = x.Name
                }).ToList()
            };

            return bid;
        }

        public BidSearchModel SearchBaseData(string structureType)
        {
            var entities = new LaneEntities();
            var baseData = new BidSearchModel();
            baseData.SearchResultsList = new List<BidSearch_Result>();

            baseData.BidTypesList = entities.Bid_Types.ToList().Select(s => new SelectListItem
            {
                Value = s.Bid_Type_ID.ToString(),
                Text = s.Name
            });

            baseData.BidStatusList = entities.Bid_Statuses.ToList().Select(s => new SelectListItem
            {
                Value = s.Bid_Status_ID.ToString(),
                Text = s.Status
            });

            baseData.JobTypesList = entities.Job_Types.ToList().Select(s => new SelectListItem
            {
                Value = s.Job_Type_ID.ToString(),
                Text = s.Code + " - " + s.Name
            });

            baseData.SiteList = entities.Sites.ToList().Select(s => new SelectListItem
            {
                Value = s.Site_ID.ToString(),
                Text = s.Name
            });

            baseData.SalesPersonList = entities.Sales_Persons.ToList().Select(s => new SelectListItem
            {
                Value = s.Sales_Person_ID.ToString(),
                Text = s.First_Name + " " + s.Last_Name
            });

            baseData.StructureTypeList = entities.Structure_Types.ToList().Select(s => new SelectListItem
            {
                Value = s.Structure_Type_ID.ToString(),
                Text = s.Name
            }).ToList();
            int structId;
            bool isNumeric = int.TryParse(structureType, out structId);

            baseData.StructureTypeId = isNumeric ? structId : GetCanopyTypeId(structureType);

            return baseData;
        }
    }
}