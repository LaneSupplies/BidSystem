using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class PhoneContactsModel
    {
        public String PhoneNumber { get; set; }
        public Int32 ContactId { get; set; }
        public IEnumerable<SelectListItem> ContactTypeList { get; set; } 
    }
}