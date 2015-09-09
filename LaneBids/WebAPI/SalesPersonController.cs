using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LaneBids.Models;
using LaneBids.Sources;

namespace LaneBids.WebAPI
{
    public class SalesPersonController : ApiController
    {
        public AdminServices _services = new AdminServices();

        // GET api/<controller>
        public IEnumerable<Sales_Persons> Get()
        {
            var entities = new LaneEntities();
            var person = entities.Sales_Persons.Select(x => x);
            return person;
        }

        // GET api/<controller>/5
        public SalesPersonDetailsModel Get(Guid id)
        {
            var entities = new LaneEntities();
            return entities.Sales_Persons.Where(x => x.Sales_Person_ID == id).Select(s => new SalesPersonDetailsModel
            {
                Name = s.First_Name + " " + s.Last_Name,
                Code = s.Sales_Person_Code,
                AddressString =
                    s.Address.Address_Line1 + ", " + s.Address.City + ", " + s.Address.State + ", " + s.Address.Zip
            }).FirstOrDefault();
        }

        // POST api/<controller>
        public Sales_Persons Post(SalesPersonDetailsModel model)
        {
            var newSalesPerson = _services.AddSalesPerson(model);

            return newSalesPerson;
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}