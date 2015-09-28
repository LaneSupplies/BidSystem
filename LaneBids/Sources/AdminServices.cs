using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaneBids.Models;
using WebMatrix.WebData;

namespace LaneBids.Sources
{
    public class AdminServices
    {
        public Sales_Persons AddSalesPerson(SalesPersonDetailsModel salesPerson)
        {
            var entities = new LaneEntities();
            var addAddress = new Address
            {
                Address_Line1 = salesPerson.AddressLine1,
                Address_Line2 = salesPerson.AddressLine2,
                City = salesPerson.City,
                State = salesPerson.State,
                Zip = salesPerson.Zip
            };
            entities.Addresses.Add(addAddress);
            entities.SaveChanges();
            
            var contactList = new List<Contact_Text>();
            if (salesPerson.PhoneContacts.Phones.Any())
            {
                foreach (var phoneContact in salesPerson.PhoneContacts.Phones)
                {
                    var contact = new Contact_Text
                    {
                        Text = phoneContact.Number,
                        Contact_Type_ID = phoneContact.TypeId,
                        Create_Date = DateTime.Now,
                        Created_By = WebSecurity.CurrentUserId
                    };

                    entities.Contact_Text.Add(contact);
                    entities.SaveChanges();
                    contactList.Add(contact);
                }
            }

            var newSalesPerson = new Sales_Persons
            {
                First_Name = salesPerson.FirstName,
                Last_Name = salesPerson.LastName,
                Address_ID = addAddress.Address_ID,
                Contact_Text = contactList.Any() ? contactList : null,
                Email = salesPerson.Email,
                Create_Date = DateTime.Now,
                Created_By = WebSecurity.CurrentUserId,
                Sales_Person_Code = salesPerson.FirstName.Substring(0,1) + salesPerson.LastName.Substring(0,1)
            };
            var savedSalesPerson = entities.Sales_Persons.Add(newSalesPerson);
            entities.SaveChanges();
            
            return savedSalesPerson;
        }

        public Sales_Persons UpdateSalesPerson(SalesPersonDetailsModel salesPerson)
        {
            var entities = new LaneEntities();
            var salPern = entities.Sales_Persons.FirstOrDefault(s => s.Sales_Person_ID == salesPerson.SalesPersonId);
            if (salPern == null) return new Sales_Persons();
            var address = salPern.Address;
            if (address != null)
            {
                var addAddress = new Address
                {
                    Address_Line1 = salesPerson.AddressLine1,
                    Address_Line2 = salesPerson.AddressLine2,
                    City = salesPerson.City,
                    State = salesPerson.State,
                    Zip = salesPerson.Zip
                };
                entities.Addresses.Add(addAddress);
                entities.SaveChanges();
            }
            
            if (salesPerson.PhoneContacts.Phones.Any())
            {
                var contactList = salPern.Contact_Text.ToList();
                foreach (var phoneContact in salesPerson.PhoneContacts.Phones)
                {
                    if (phoneContact.ContactId != null)
                    {
                        var updateContact =
                            entities.Contact_Text.FirstOrDefault(_ => _.Contact_Text_ID == phoneContact.ContactId);
                        if (updateContact != null)
                        {
                            updateContact.Contact_Type_ID = phoneContact.TypeId;
                            updateContact.Text = phoneContact.Number;
                        }
                        else
                        {
                            //Something is wrong here!!
                        }
                        entities.SaveChanges();
                    }
                    else
                    {
                        var contact = new Contact_Text
                        {
                            Text = phoneContact.Number,
                            Contact_Type_ID = phoneContact.TypeId,
                            Create_Date = DateTime.Now,
                            Created_By = WebSecurity.CurrentUserId
                        };
                        entities.Contact_Text.Add(contact);
                        entities.SaveChanges();
                        contactList.Add(contact);
                    }
                }
                entities.SaveChanges();
            }


            salPern.First_Name = salesPerson.FirstName;
            salPern.Last_Name = salesPerson.LastName;
            salPern.Email = salesPerson.Email;
            salPern.Create_Date = DateTime.Now;
            salPern.Created_By = WebSecurity.CurrentUserId;
            salPern.Sales_Person_Code = salesPerson.Code;
        
            entities.SaveChanges();

            return salPern;
        }

        public CompanyModel AddCompany(CompanyModel company)
        {
            var entities = new LaneEntities();
            var newCompany = new Company
            {
                Company_Name = company.Name,
                Company_Code = company.CompanyCode
            };

            entities.Companies.Add(newCompany);
            entities.SaveChanges();
            return company;
        }

        public CustomerModel AddCustomer(CustomerModel customer)
        {
            var entities = new LaneEntities();
            var newAddress = new Address
            {
                Address_Line1 = customer.AddressLine1,
                Address_Line2 = customer.AddressLine2,
                City = customer.City,
                State = customer.State,
                Zip = customer.Zip
            };

            entities.Addresses.Add(newAddress);
            entities.SaveChanges();

            var newCustomer = new Customer
            {
                Company_Region_Name = customer.RegionName,
                Address_ID = newAddress.Address_ID,
                Company_ID = customer.CompanyId
            };

            entities.Customers.Add(newCustomer);
            entities.SaveChanges();
            return customer;
        }
    }
}
