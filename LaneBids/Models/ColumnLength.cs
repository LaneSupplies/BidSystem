using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnLength
    {
        public IEnumerable<MeasurementLength> measurements { get; set; }
    }

    public class MeasurementLength
    {
        public int feet { get; set; }
        public int inches { get; set; }
    }
}