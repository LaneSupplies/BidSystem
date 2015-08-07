using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnWidths
    {
        public IEnumerable<MeasurementWidth> measurements { get; set; }
    }

    public class MeasurementWidth
    {
        public int feet { get; set; }
        public int inches { get; set; }
    }
}