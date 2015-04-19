using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models.Admin
{
    public class StructureTypeList
    {
        public IEnumerable<StructureTypeModel> StructureTypes { get; set; }
    }

    public class StructureTypeModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public DateTime? Create_Date { get; set; }
        public string FullName { get; set; }
    }
}