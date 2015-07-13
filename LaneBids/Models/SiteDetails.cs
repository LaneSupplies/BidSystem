using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class SiteDetails
    {
        public Int32 SiteId { get; set; }
        public String SiteName { get; set; }
        public String AddressLine1 { get; set; }
        public String AddressLine2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String Zip { get; set; }
        public String Country { get; set; }
        public AddressModel Address { get; set; }

        public IList<SelectListItem> SiteList { get; set; } 
    }
}