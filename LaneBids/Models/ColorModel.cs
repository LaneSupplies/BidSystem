using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaneBids.Models
{
    public class ColorModel
    {
        public string ColorId { get; set; }
        public string ColorName { get; set; }
        public string ColorText { get; set; }

        public IList<SelectListItem> FasciaColorList { get; set; }
    }
}