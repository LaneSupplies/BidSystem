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
        public CompanyModel Put(Guid id, [FromBody]CompanyModel model)
        {
            var entities = new LaneEntities();
            var updateCompany = entities.Companies.FirstOrDefault(x => x.Company_ID == id);

            if (updateCompany == null) return null;

            updateCompany.CompanyName = model.Name;
            updateCompany.Company_Code = model.CompanyCode;
            entities.SaveChanges();
            return model;
        }

        // DELETE api/<controller>/5
        public string Delete(Guid id)
        {
            var entities = new LaneEntities();
            var deleteCompany = entities.Companies.FirstOrDefault(x => x.Company_ID == id);
            if (deleteCompany == null) return "Error";

            entities.Companies.Remove(deleteCompany);
            entities.SaveChanges();
            return "Success";
        }
    }
}