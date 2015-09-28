using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LaneBids.Models;

namespace LaneBids.WebAPI
{
    public class CustomerListController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<CustomerModel> Get()
        {
            var entities = new LaneEntities();
            return entities.Customers.Select(_ => new CustomerModel
            {
                CustomerId = _.Customer_ID,
                RegionName = _.Company_Region_Name
            });
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
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