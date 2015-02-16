﻿using System;
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
            bid.StructureList.Add(new SelectListItem { Selected = true, Text = " -- Select Structure -- ", Value = "None" });

            bid.BidTypeList = entities.Bid_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Bid_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            bid.BidTypeList.Add(new SelectListItem { Selected = true, Text = " -- Select Type -- ", Value = "None" });

            bid.BidStatusList = entities.Bid_Statuses.ToList().Select(x => new SelectListItem
            {
                Value = x.Bid_Status_ID.ToString(),
                Text = x.Status
            }).ToList();
            bid.BidStatusList.Add(new SelectListItem { Selected = true, Text = " -- Select Status -- ", Value = "None" });

            bid.JobTypeList = entities.Job_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Job_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            bid.JobTypeList.Add(new SelectListItem { Selected = true, Text = " -- Select Job Type -- ", Value = "None" });

            bid.ScopeTypeList = entities.Scope_Types.ToList().Select(x => new SelectListItem
            {
                Value = x.Scope_Type_ID.ToString(),
                Text = x.Name
            }).ToList();
            bid.ScopeTypeList.Add(new SelectListItem { Selected = true, Text = " -- Select Scope Type -- ", Value = "None" });

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

            //bid.SalesPeople = Roles.GetUsersInRole("SalesPeople").Select(Membership.GetUser).Select(user => new SelectListItem
            //{
            //    Value = user.ProviderUserKey.ToString(), 
            //    Text = user.UserName,
            //}).ToList();

            //Contact Types
            var contactTypeList = entities.Contact_Types.ToList().Select(s => new SelectListItem
            {
                Value = s.Contact_Type_ID.ToString(),
                Text = s.Name
            });

            //Customer Data
            bid.AddCustomerInfo = new CustomerDetails();
            bid.AddCustomerInfo.Address = new AddressModel();
            bid.AddCustomerInfo.Address.StateList = AddressService.States;
            bid.AddCustomerInfo.PhoneContacts = new PhoneContacts();
            bid.AddCustomerInfo.PhoneContacts.ContactTypeList = contactTypeList;

            bid.AddCustomerInfo.CustomerList = entities.Customers.OrderBy(x => x.Last_Name).ToList().Select(x => new SelectListItem
            {
                Value = x.Customer_ID.ToString(),
                Text = x.First_Name + " " + x.Last_Name
            }).ToList();

            //Sales Person Data
            bid.AddSalesPersonDetails = new SalesPersonDetails();
            bid.AddSalesPersonDetails.Address = new AddressModel();
            bid.AddSalesPersonDetails.Address.StateList = AddressService.States;
            bid.AddSalesPersonDetails.PhoneContacts = new PhoneContacts();
            bid.AddSalesPersonDetails.PhoneContacts.ContactTypeList = contactTypeList;

            bid.AddSalesPersonDetails.SalesPersonList =
                                entities.Sales_Persons.ToList().Select(x => new SelectListItem
                                {
                                    Value = x.Sales_Person_ID.ToString(),
                                    Text = x.First_Name + " " + x.Last_Name
                                }).ToList();

            bid.AddSiteDetails = new SiteDetails();
            bid.AddSiteDetails.Address = new AddressModel();
            bid.AddSiteDetails.Address.StateList = AddressService.States;
            bid.AddSiteDetails.SiteList = entities.Sites.ToList().Select(x => new SelectListItem
            {
                Value = x.Site_ID.ToString(),
                Text = x.Name
            }).ToList();

            bid.AddShippingInfoDetails = new ShippingInfoDetails();
            bid.AddShippingInfoDetails.StateList = AddressService.States;
            bid.AddShippingInfoDetails.ShippingList = entities.Shipping_Info.ToList().Select(x => new SelectListItem
            {
                Value = x.Shipping_ID.ToString(),
                Text = x.Name
            }).ToList();

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