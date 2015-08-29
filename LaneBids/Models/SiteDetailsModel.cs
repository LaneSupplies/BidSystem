using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class SiteDetailsModel
    {
        public int SiteId { get; set; }
        public string MainName { get; set; }
        public string PrefixMainName { get; set; }
        public string SuffixMainName { get; set; }
        public string SubName { get; set; }
        public string PrefixSubName { get; set; }
        public string SuffixSubName { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public AddressModel Address { get; set; }

        public IList<SelectListItem> SiteList { get; set; } 
    }
}