using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnLength
    {
        public IList<MeasurementLength> measurements { get; set; }
    }

    public class MeasurementLength
    {
        public int Feet { get; set; }
        public int Inches { get; set; }
    }
}