using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaneBids.Models.Admin;

namespace LaneBids.Models
{
    public class AdminMaintenance
    {
        public TypeDataListModel StructureTypeList { get; set; } 
        public IEnumerable<object> BidTypesList { get; set; }
        public IEnumerable<object> BidStatusList { get; set; }
        public IEnumerable<object> JobTypesList { get; set; }
        public IEnumerable<object> ScopeTypesList { get; set; }
        public IEnumerable<object> ColumnTypesList { get; set; }
        public IEnumerable<object> ColumnShapesList { get; set; }
        public IEnumerable<object> DeckStylesList { get; set; }
        public IEnumerable<object> FasciaTypesList { get; set; }
        public IEnumerable<object> DrainageList { get; set; } 
    }
}