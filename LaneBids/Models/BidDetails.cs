using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace LaneBids.Models
{
    public class BidDetails
    {
        public Int32 BidId { get; set; }
        public Int32 RevisionNumber { get; set; }

        [Required(ErrorMessage = "You must choose a Structure Type")]
        public Int32 StructureId { get; set; }

        [Required(ErrorMessage = "You must choose a Bid Type")]
        public Int32 BidTypeId { get; set; }

        [Required(ErrorMessage = "You must choose a Bid Status")]
        public Int32 BidStatusId { get; set; }

        [Required(ErrorMessage = "You must choose a Job Type")]
        public Int32 JobTypeId { get; set; }
        
        public String JobTypeCode { get; set; }

        [Required(ErrorMessage = "You must choose a Scope Type")]
        public Int32 ScopeTypeId { get; set; }

        [Required(ErrorMessage = "You must choose a Scope Type")]
        public String ScopeTypeCode { get; set; }

        [Required(ErrorMessage = "You must choose a Customer")]
        public Guid CustomerId { get; set; }

        [Required(ErrorMessage = "You must choose a Sales Person")]
        public Int32 SalesPersonId { get; set; }

        [Required(ErrorMessage = "You must choose a Site")]
        public Int32 SiteId { get; set; }


        public Int32 ShippingId { get; set; }
        public Int32 BidNotesId { get; set; }
        public String BidNotesText { get; set; }
        public Int32 CanopyId { get; set; }
        public String CreatedBy { get; set; }
        public String ModifiedBy { get; set; }
        public CustomerDetails AddCustomerInfo { get; set; }
        public SalesPersonDetails AddSalesPersonDetails { get; set; }
        public SiteDetails AddSiteDetails { get; set; }
        public ShippingInfoDetails AddShippingInfoDetails { get; set; }

        public IList<SelectListItem> StructureList { get; set; }

        public IList<SelectListItem> ScopeTypeList { get; set; }

        public IList<SelectListItem> AddressesList { get; set; }

        public IList<SelectListItem> ShippingList { get; set; }

        public IList<SelectListItem> BidStatusList { get; set; }

        public IList<SelectListItem> BidTypeList { get; set; }

        public IList<SelectListItem> JobTypeList { get; set; }

        public IList<SelectListItem> BidNoteList { get; set; }
        
        public IList<SelectListItem> SiteList { get; set; } 
    }
}