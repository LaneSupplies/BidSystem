using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaneBids.Models
{
    public class ColumnLengthModel
    {
        public IEnumerable<MeasurementLengthModel> measurements { get; set; }
    }

    public class MeasurementLengthModel
    {
        public int feet { get; set; }
        public int inches { get; set; }
    }
}