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
    public class CommonListsController : ApiController
    {
        // GET api/<controller>
        public CommonListModel Get()
        {
            var entities = new LaneEntities();
            var contactList = entities.Contact_Types.ToList().Select(s => new SelectListItem
            {
                Text = s.Name,
                Value = s.Contact_Type_ID.ToString()
            });
            
            return new CommonListModel
            {
                States = AddressService.States,
                ContactTypes = contactList
            };
        }
    }
}
