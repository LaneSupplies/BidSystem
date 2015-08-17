using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class CustomerDetailsModel
    {
        public System.Guid CustomerId { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public String Email { get; set; }
        public String CompanyName { get; set; }
        public String AddressLine1 { get; set; }
        public String AddressLine2 { get; set; }
        public String City { get; set; }
        public String State { get; set; }
        public String Zip { get; set; }
        public String Country { get; set; }
        public String PhoneNumber { get; set; }
        public Int32 ContactId { get; set; }

        public AddressModel Address { get; set; }
        public PhoneContactsModel PhoneContacts { get; set; }

        public IList<SelectListItem> CustomerList { get; set; } 
    }
}