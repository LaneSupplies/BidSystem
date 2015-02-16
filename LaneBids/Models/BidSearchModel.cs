using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class BidSearchModel
    {
        public int BidId { get; set; }
        public int BidStatusId { get; set; }
        public int BidTypeId { get; set; }
        public int StructureTypeId { get; set; }
        public int JobTypeId { get; set; }
        public int SiteId { get; set; }
        public int RevisionNumber { get; set; }
        public int SalesPersonId { get; set; }

        public IEnumerable<SelectListItem> SiteList { get; set; }
        public IEnumerable<SelectListItem> BidTypesList { get; set; }
        public IEnumerable<SelectListItem> BidStatusList { get; set; }
        public IEnumerable<SelectListItem> StructureTypeList { get; set; } 
        public IEnumerable<SelectListItem> JobTypesList { get; set; }
        public IEnumerable<SelectListItem> SalesPersonList { get; set; } 
        public List<BidSearch_Result> SearchResultsList { get; set; }
    }
}