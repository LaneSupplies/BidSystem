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
        public IEnumerable<SalesPersonDetailsModel> Get()
        {
            var entities = new LaneEntities();
            var person = entities.Sales_Persons.Select(x => new SalesPersonDetailsModel
            {
                SalesPersonId = x.Sales_Person_ID,
                Code = x.Sales_Person_Code,
                FirstName = x.First_Name,
                LastName = x.Last_Name,
                AddressLine1 = x.Address.Address_Line1,
                AddressLine2 = x.Address.Address_Line2,
                City = x.Address.City,
                State = x.Address.State,
                Zip = x.Address.Zip,
                PhoneContacts = new PhoneContactsModel {
                    Phones = x.Contact_Text.Select(y => new PersonContact
                    {
                        TypeId = y.Contact_Type_ID,
                        Number = y.Text,
                        ContactId = y.Contact_Text_ID
                    }) },
                Email = x.Email,
            });
            return person;
        }

        // GET api/<controller>/5
        public SalesPersonDetailsModel Get(Guid id)
        {
            var entities = new LaneEntities();
            return entities.Sales_Persons.Where(x => x.Sales_Person_ID == id).Select(s => new SalesPersonDetailsModel
            {
                SalesPersonId = s.Sales_Person_ID,
                Code = s.Sales_Person_Code,
                FirstName = s.First_Name,
                LastName = s.Last_Name,
                AddressLine1 = s.Address.Address_Line1,
                AddressLine2 = s.Address.Address_Line2,
                City = s.Address.City,
                State = s.Address.State,
                Zip = s.Address.Zip,
                PhoneContacts = new PhoneContactsModel
                {
                    Phones = s.Contact_Text.Select(y => new PersonContact
                    {
                        ContactId = y.Contact_Text_ID,
                        TypeId = y.Contact_Type_ID,
                        Number = y.Text
                    })
                },
                Email = s.Email,
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