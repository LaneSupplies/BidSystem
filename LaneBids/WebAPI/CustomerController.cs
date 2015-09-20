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
    public class CustomerController : ApiController
    {
        private AdminServices _services = new AdminServices();

        // GET api/<controller>
        public IQueryable<CustomerModel> Get()
        {
            var entities = new LaneEntities();
            return entities.Customers.Select(_ => new CustomerModel
            {
                CustomerId = _.Customer_ID,
                RegionName = _.Company_Region_Name,
                AddressId = _.Address_ID,
                AddressLine1 = _.Address.Address_Line1,
                AddressLine2 = _.Address.Address_Line2,
                City = _.Address.City,
                State = _.Address.State,
                Zip = _.Address.Zip,
                CompanyName = _.Company.Company_Name,
                CompanyId = _.Company.Company_ID,
            });
        }

        // GET api/<controller>/5
        public CustomerModel Get(Guid id)
        {
            var entities = new LaneEntities();
            return entities.Customers.Where(s => s.Company_ID == id).Select(_ => new CustomerModel
            {
                CustomerId = _.Customer_ID,
                RegionName = _.Company_Region_Name,
                AddressId = _.Address_ID,
                AddressLine1 = _.Address.Address_Line1,
                AddressLine2 = _.Address.Address_Line2,
                City = _.Address.City,
                State = _.Address.State,
                Zip = _.Address.Zip,
                CompanyName = _.Company.Company_Name,
                CompanyId = _.Company_ID,
            }).FirstOrDefault();
        }

        // POST api/<controller>
        public CustomerModel Post(CustomerModel model)
        {
            var newCustomer = _services.AddCustomer(model);

            return newCustomer;
        }

        // PUT api/<controller>/5
        public CustomerModel Put(Guid id, [FromBody]CustomerModel model)
        {
            var entities = new LaneEntities();
            var updateCustomer = entities.Customers.FirstOrDefault(x => x.Customer_ID == id);

            if (updateCustomer == null) return null;

            updateCustomer.Company_Region_Name = model.RegionName;
            updateCustomer.Company_ID = model.CompanyId;
            entities.SaveChanges();

            var customerAddress = entities.Addresses.FirstOrDefault(x => x.Address_ID == model.AddressId);
            if (customerAddress == null) return model;

            customerAddress.Address_Line1 = model.AddressLine1;
            customerAddress.Address_Line2 = model.AddressLine2;
            customerAddress.City = model.City;
            customerAddress.State = model.State;
            customerAddress.Zip = model.Zip;

            entities.SaveChanges();

            return model;
        }

        // DELETE api/<controller>/5
        public string Delete(Guid id)
        {
            var entities = new LaneEntities();
            var deleteCustomer = entities.Customers.FirstOrDefault(x => x.Customer_ID == id);
            if (deleteCustomer == null) return "Error";

            entities.Customers.Remove(deleteCustomer);
            entities.SaveChanges();
            return "Success";
        }
    }
}
