using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class CustomerModel
    {
        public Guid? CustomerId { get; set; }
        public string RegionName { get; set; }
        public string SalesCode { get; set; }
        public string BidCode { get; set; }
        public Guid? AddressId { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string CompanyName { get; set; }
        public Guid CompanyId { get; set; }
    }
}