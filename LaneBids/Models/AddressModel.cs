using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class AddressModel
    {
        public int AddressId { get; set; }
        public String AddressLine1 { get; set; }
        public String AddressLine2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String Zip { get; set; }
        public String Country { get; set; }

        public IEnumerable<SelectListItem> AddressList { get; set; }
        public IEnumerable<SelectListItem> StateList { get; set; } 
    }
}