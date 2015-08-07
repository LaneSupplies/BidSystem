using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaneBids.Models;

namespace LaneBids.Sources
{
    public class CommonServices
    {

        public int MeasurementId(int feet, int inches)
        {
            var entity = new LaneEntities();
            var existing = entity.Measurements.Where(x => x.Feet == feet && x.Inches == inches);

            if (existing.Any() && existing.FirstOrDefault() != null)
                return existing.FirstOrDefault().Measurement_ID;

            var newMeasurement = new Measurement();
            newMeasurement.Feet = feet;
            newMeasurement.Inches = inches;
            entity.Measurements.Add(newMeasurement);
            entity.SaveChanges();

            return newMeasurement.Measurement_ID;
        }
    }
}