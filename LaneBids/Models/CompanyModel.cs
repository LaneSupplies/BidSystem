using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class CompanyModel
    {
        public Guid CompanyId { get; set; }
        public string CompanyCode { get; set; }
        public string Name { get; set; }
    }
}