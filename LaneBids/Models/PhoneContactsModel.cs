using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class PhoneContactsModel
    {
        public IEnumerable<PersonContact> contact { get; set; }
    }

    public class PersonContact { 
        public string Number { get; set; }
        public int Id { get; set; }
    }
}