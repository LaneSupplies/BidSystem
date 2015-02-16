using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class SalesPersonDetails
    {
        public Int32 SalesPersonId { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public String AddressLine1 { get; set; }
        public String AddressLine2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String Zip { get; set; }
        public String Country { get; set; }
        public String PhoneNumber { get; set; }
        public Int32 ContactId { get; set; }
        public AddressModel Address { get; set; }
        public PhoneContacts PhoneContacts { get; set; }

        public IList<SelectListItem> SalesPersonList { get; set; } 
    }
}