using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class BidViewModel
    {
        public BidDetailsModel Bid { get; set; }
        public List<CanopyDetailsModel> Canopies { get; set; } 
    }
}