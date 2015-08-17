using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnWidthsModel
    {
        public IEnumerable<MeasurementWidthModel> measurements { get; set; }
    }

    public class MeasurementWidthModel
    {
        public int feet { get; set; }
        public int inches { get; set; }
    }
}