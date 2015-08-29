using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaneBids.Models;
using WebMatrix.WebData;

namespace LaneBids.Sources
{
    public class HomeServices
    {
        public SiteDetailsModel SaveSite(SiteDetailsModel site)
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
            newSite.Main_Name = site.MainName;
            newSite.Main_Name_Prefix = site.PrefixMainName;
            newSite.Main_Name_Suffix = site.SuffixMainName;
            newSite.Sub_Name = site.SubName;
            newSite.Sub_Name_Prefix = site.PrefixSubName;
            newSite.Sub_Name_Suffix = site.SuffixSubName;
            newSite.Address_ID = addAddress.Address_ID;
            newSite.Create_Date = DateTime.Now;
            newSite.Created_By = WebSecurity.CurrentUserId;
            entities.Sites.Add(newSite);
            entities.SaveChanges();

            return site;
        }
    }
}