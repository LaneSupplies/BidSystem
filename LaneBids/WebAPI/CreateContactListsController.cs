using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using LaneBids.Models;
using LaneBids.Sources;

namespace LaneBids.WebAPI
{
    public class CreateContactListsController : ApiController
    {
        // GET api/<controller>
        public CreateContactListModel Get()
        {
            var entities = new LaneEntities();
            var contactList = entities.Contact_Types.ToList().Select(s => new SelectListItem
            {
                Text = s.Name,
                Value = s.Contact_Type_ID.ToString()
            });
            return new CreateContactListModel
            {
                States = AddressService.States,
                ContactTypes = contactList
            };
        }

        // GET api/<controller>/5
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<controller>
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT api/<controller>/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE api/<controller>/5
        //public void Delete(int id)
        //{
        //}
    }
}
