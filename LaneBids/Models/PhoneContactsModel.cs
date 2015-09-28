using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class PhoneContactsModel
    {
        public IEnumerable<PersonContact> Phones { get; set; }
    }

    public class PersonContact {
        public Guid? ContactId { get; set; }
        public string Number { get; set; }
        public int TypeId { get; set; }
    }
}
