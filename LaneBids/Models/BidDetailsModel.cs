using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace LaneBids.Models
{
    public class BidDetailsModel
    {
        public int BidId { get; set; }
        public int RevisionNumber { get; set; }

        [Required(ErrorMessage = "You must choose a Structure Type")]
        public int StructureId { get; set; }
        public string SelectedStructureName { get; set; }

        [Required(ErrorMessage = "You must choose a Bid Type")]
        public int BidTypeId { get; set; }
        public string SelectedBidTypeName { get; set; }

        [Required(ErrorMessage = "You must choose a Bid Status")]
        public int BidStatusId { get; set; }
        public string SelectedBidStatusName { get; set; }

        [Required(ErrorMessage = "You must choose a Job Type")]
        public int JobTypeId { get; set; }
        public string SelectedJobTypeName { get; set; }
        
        public string JobTypeCode { get; set; }

        [Required(ErrorMessage = "You must choose a Scope Type")]
        public int ScopeTypeId { get; set; }
        public string ScopeTypeCode { get; set; }
        public string SelectedScopeTypeName { get; set; }

        [Required(ErrorMessage = "You must choose a Customer")]
        public Guid CustomerId { get; set; }
        public Customer Customer { get; set; }

        [Required(ErrorMessage = "You must choose a Sales Person")]
        public int SalesPersonId { get; set; }
        public SalesPersonDetailsModel SelectedSalesPerson { get; set; }

        [Required(ErrorMessage = "You must choose a Site")]
        public int SiteId { get; set; }
        public SiteDetailsModel SelectedSite { get; set; }


        public int ShippingId { get; set; }
        public AddressModel SelectedShippingAddress { get; set; }

        public int BidNotesId { get; set; }
        public Bid_Notes BidNotes { get; set; }

        public string BidNotesText { get; set; }
        public int CanopyId { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public CustomerDetailsModel AddCustomerInfo { get; set; }
        public SalesPersonDetailsModel AddSalesPersonDetails { get; set; }
        public SiteDetailsModel AddSiteDetails { get; set; }
        public ShippingInfoDetailsModel AddShippingInfoDetails { get; set; }

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