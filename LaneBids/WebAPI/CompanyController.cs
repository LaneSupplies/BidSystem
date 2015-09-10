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
    public class CompanyController : ApiController
    {
        public AdminServices _services = new AdminServices();

        // GET api/<controller>
        public IEnumerable<CompanyModel> Get()
        {
            var entities = new LaneEntities();
            return entities.Companies.Select(_ => new CompanyModel
            {
                CompanyId = _.Company_ID,
                CompanyCode = _.Company_Code,
                Name = _.CompanyName
            });
        }

        // GET api/<controller>/5
        public CompanyModel Get(Guid id)
        {
            var entities = new LaneEntities();
            return entities.Companies.Where(s => s.Company_ID == id).Select(_ => new CompanyModel
            {
                CompanyId = _.Company_ID,
                CompanyCode = _.Company_Code,
                Name = _.CompanyName
            }).FirstOrDefault();
        }

        // POST api/<controller>
        public CompanyModel Post(CompanyModel model)
        {
            var newCompany = _services.AddCompany(model);

            return newCompany;
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