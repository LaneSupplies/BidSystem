using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class SalesPersonDetailsModel
    {
        public Guid SalesPersonId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public string AddressString { get; set; }
        public AddressModel Address { get; set; }
        public PhoneContactsModel PhoneContacts { get; set; }

        public IList<SelectListItem> SalesPersonList { get; set; } 
    }
}