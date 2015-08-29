using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaneBids.Models;

namespace LaneBids.Sources
{
    public class CommonServices
    {

        public Guid GetMeasurementId(MeasurementModel measurement)
        {
            var entity = new LaneEntities();
            var existing = entity.Measurements.Where(x => x.Feet == measurement.Feet && x.Inches == measurement.Inches && x.Fractions_ID == measurement.FractionId);

            if (existing.Any() && existing.FirstOrDefault() != null)
                return existing.FirstOrDefault().Measurement_ID;

            var newMeasurement = new Measurement
            {
                Feet = measurement.Feet,
                Inches = measurement.Inches,
                Fractions_ID = measurement.FractionId
            };
            entity.Measurements.Add(newMeasurement);
            entity.SaveChanges();

            return newMeasurement.Measurement_ID;
        }
    }
}