using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnWidths
    {
        public IList<MeasurementWidth> measurements { get; set; }
    }

    public class MeasurementWidth
    {
        public int Feet { get; set; }
        public int Inches { get; set; }
    }
}