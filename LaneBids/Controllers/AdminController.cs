using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using LaneBids.Models;
using LaneBids.Models.Admin;
using LaneBids.Sources;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using WebMatrix.WebData;

namespace LaneBids.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult CreateUser()
        {
            ViewBag.Title = "Create User";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateUser(RegisterModel model)
        {
            ViewBag.Title = "Create User";
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                try
                {
                    if (!Roles.RoleExists(model.Role))
                    {
                        Roles.CreateRole(model.Role);
                    }
                    
                    WebSecurity.CreateUserAndAccount(model.UserName, model.Password,
                                propertyValues: new
                                {
                                    Email = model.Email,
                                    FirstName = model.FirstName,
                                    LastName = model.LastName,
                                    Role = model.Role
                                });

                    Roles.AddUserToRole(model.UserName, model.Role);
                    var currentUserId = WebSecurity.CurrentUserId;
                    WebSecurity.Login(model.UserName, model.Password);

                    if (model.Role == "SalesPerson")
                    {
                        var entities = new LaneEntities();
                        var laneUsers = entities.Sales_Persons.FirstOrDefault(x => x.Sales_Person_ID == WebSecurity.CurrentUserId);
                        if (laneUsers == null)
                        {
                            var salesPerson = new Sales_Persons();
                            salesPerson.Sales_Person_ID = WebSecurity.CurrentUserId;
                            salesPerson.First_Name = model.FirstName;
                            salesPerson.Last_Name = model.LastName;
                            salesPerson.Create_Date = DateTime.Now;
                            salesPerson.Created_By = currentUserId;
                            entities.Sales_Persons.Add(salesPerson);
                            entities.SaveChanges();
                        }
                    }

                    return RedirectToAction("Index", "Home");
                }
                catch (MembershipCreateUserException e)
                {
                    ModelState.AddModelError("", e.Message);
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult Maintenance()
        {
            ViewBag.Title = "Admin Maintenance";
            var entities = new LaneEntities();

            var adminMaint = new AdminMaintenance
            {
                StructureTypeList = new TypeDataListModel{
                    GridTitle = "Structure Type",
                    TypeDataEnum = TypeDataEnum.StructureType,
                    Types = entities.Structure_Types.ToList().Select(type => new TypeDataModel
                {
                    ID = type.Structure_Type_ID,
                    Name = type.Name,
                    Create_Date = String.Format("{0:d}", type.Create_Date),
                    FullName = UserServices.ConvertUserId(type.Created_By)
                })},
                BidTypesList = entities.Bid_Types.ToList().Select(type => new
                {
                    type.Bid_Type_ID,
                    type.Name,
                    type.Code,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                BidStatusList = entities.Bid_Statuses.ToList().Select(type => new
                {
                    type.Bid_Status_ID,
                    type.Status,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                JobTypesList = entities.Job_Types.ToList().Select(type => new
                {
                    type.Job_Type_ID,
                    type.Name,
                    type.Code,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                ScopeTypesList = entities.Scope_Types.ToList().Select(type => new
                {
                    type.Scope_Type_ID,
                    type.Name,
                    type.Code,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                ColumnTypesList = entities.Column_Types.ToList().Select(type => new
                {
                    type.Column_Type_ID,
                    type.Name,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                ColumnShapesList = entities.Column_Shapes.ToList().Select(type => new
                {
                    type.Column_Shape_ID,
                    type.Name,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                DeckStylesList = entities.Deck_Styles.ToList().Select(type => new
                {
                    type.Deck_Style_ID,
                    type.Name,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                FasciaTypesList = entities.Fascia_Types.ToList().Select(type => new
                {
                    type.Fascia_Type_ID,
                    type.Name,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                }),
                DrainageList = entities.Drainage_Types.ToList().Select(type => new
                {
                    type.Drainage_Type_ID,
                    type.Name,
                    type.Create_Date,
                    FullName = UserServices.ConvertUserId(type.Created_By)
                })
            };

            return View(adminMaint);
        }

        [HttpGet]
        public JsonResult TypeData(string type)
        {
            var entities = new LaneEntities();
            var model = new List<TypeDataModel>();

            var typeEnum = (TypeDataEnum)Enum.Parse(typeof(TypeDataEnum), type);

            switch (typeEnum)
            {
                case TypeDataEnum.StructureType:
                    model = entities.Structure_Types.ToList().Select(t => new TypeDataModel
                    {
                        ID = t.Structure_Type_ID,
                        Name = t.Name,
                        Create_Date = String.Format("{0:d}", t.Create_Date),
                        FullName = UserServices.ConvertUserId(t.Created_By),
                        TypeDataEnum = typeEnum
                    }).ToList();
                    break;
            }

            return Json(model, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult TypeDataEdit(string id, string typeName)
        {
            var entities = new LaneEntities();
            var model = new TypeDataModel();

            var type = (TypeDataEnum) Enum.Parse(typeof (TypeDataEnum), typeName);
            var intId = Convert.ToInt32(id);

            switch (type)
            {
                case TypeDataEnum.StructureType:
                    model = entities.Structure_Types.Where(x => x.Structure_Type_ID == intId).ToList().Select(t => new TypeDataModel
                    {
                        ID = t.Structure_Type_ID,
                        Name = t.Name,
                        Create_Date = String.Format("{0:d}", t.Create_Date),
                        FullName = UserServices.ConvertUserId(t.Created_By),
                        TypeDataEnum = type
                    }).FirstOrDefault();
                    break;
            }

            return Json(model, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult TypeDataUpdate(TypeDataModel model)
        {
            var entities = new LaneEntities();
            
            switch (model.TypeDataEnum)
            {
                case TypeDataEnum.StructureType:
                    var item = entities.Structure_Types.FirstOrDefault(x => x.Structure_Type_ID == model.ID);
                    item.Name = model.Name;
                    item.Create_Date = DateTime.Now;
                    item.Created_By = WebSecurity.CurrentUserId;
                    break;
            }

            entities.SaveChanges();
            return Content("Success");
        }

        [HttpPost]
        public ActionResult TypeDataDelete(TypeDataModel model)
        {
            var entities = new LaneEntities();

            switch (model.TypeDataEnum)
            {
                case TypeDataEnum.StructureType:
                    var item = entities.Structure_Types.FirstOrDefault(x => x.Structure_Type_ID == model.ID);
                    entities.Structure_Types.Remove(item);
                    break;
            }

            entities.SaveChanges();
            return Content("Success");
        }

        [HttpPost]
        public ActionResult BidTypes(Bid_Types bidTypes)
        {
            var entities = new LaneEntities();
            var type = entities.Bid_Types.FirstOrDefault(x => x.Bid_Type_ID == bidTypes.Bid_Type_ID);
            if (type != null)
            {
                type.Name = bidTypes.Name;
                type.Code = bidTypes.Code;
                type.Create_Date = DateTime.Now;
                type.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                bidTypes.Create_Date = DateTime.Now;
                bidTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Bid_Types.Add(bidTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult BidStatus(Bid_Statuses bidStatuses)
        {
            var entities = new LaneEntities();
            var status = entities.Bid_Statuses.FirstOrDefault(x => x.Bid_Status_ID == bidStatuses.Bid_Status_ID);
            if (status != null)
            {
                status.Status = bidStatuses.Status;
                status.Create_Date = DateTime.Now;
                status.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                bidStatuses.Create_Date = DateTime.Now;
                bidStatuses.Created_By = WebSecurity.CurrentUserId;
                entities.Bid_Statuses.Add(bidStatuses);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult JobTypes(Job_Types jobTypes)
        {
            var entities = new LaneEntities();
            var job = entities.Job_Types.FirstOrDefault(x => x.Job_Type_ID == jobTypes.Job_Type_ID);
            if (job != null)
            {
                job.Name = jobTypes.Name;
                job.Code = jobTypes.Code;
                job.Create_Date = DateTime.Now;
                job.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                jobTypes.Create_Date = DateTime.Now;
                jobTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Job_Types.Add(jobTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult ScopeType(Scope_Types scopeTypes)
        {
            var entities = new LaneEntities();
            var scope = entities.Scope_Types.FirstOrDefault(x => x.Scope_Type_ID == scopeTypes.Scope_Type_ID);
            if (scope != null)
            {
                scope.Name = scopeTypes.Name;
                scope.Code = scopeTypes.Code;
                scope.Create_Date = DateTime.Now;
                scope.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                scopeTypes.Create_Date = DateTime.Now;
                scopeTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Scope_Types.Add(scopeTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        #region Structure Types
        
        //[HttpPost]
        //public JsonResult StructureTypeAdd(TypeDataModel structureTypes)
        //{
        //    var entities = new LaneEntities();
        //    var structure = entities.Structure_Types
        //        .FirstOrDefault(x => x.Structure_Type_ID == structureTypes.ID);
        //    if (structure != null)
        //    {
        //        structure.Name = structureTypes.Name;
        //        structure.Create_Date = DateTime.Now;
        //        structure.Created_By = WebSecurity.CurrentUserId;
        //        entities.SaveChanges();
        //    }
        //    else
        //    {
        //        entities.Structure_Types.Add(new Structure_Types
        //        {
        //            Name = structureTypes.Name,
        //            Create_Date = String.Format("{0:d}", structureTypes.Create_Date),
        //            Created_By = WebSecurity.CurrentUserId
        //        });
        //        entities.SaveChanges();
        //    }
        //    return null;
        //}

        //public JsonResult StructureTypeAll()
        //{
        //    var entities = new LaneEntities();
        //    var data = entities.Structure_Types.AsQueryable();
        //    var ajaxGridFactory = new Grid.Mvc.Ajax.GridExtensions.AjaxGridFactory();
        //    var grid = ajaxGridFactory.CreateAjaxGrid(data, 1, true);
        //    return Json(grid);
        //}

        //public PartialViewResult StructureTypeEdit(int id)
        //{
        //    var entities = new LaneEntities();
        //    var data = entities.Structure_Types.Where(x => x.Structure_Type_ID == id);
        //    //var ajaxGridFactory = new Grid.Mvc.Ajax.GridExtensions.AjaxGridFactory();
        //    //var grid = ajaxGridFactory.CreateAjaxGrid(data, page, true);
        //    return PartialView("Modal/_StructureType", data);
        //}

        #endregion

        [HttpPost]
        public ActionResult ColumnTypes(Column_Types columnTypes)
        {
            var entities = new LaneEntities();
            var colType = entities.Column_Types.FirstOrDefault(x => x.Column_Type_ID == columnTypes.Column_Type_ID);
            if (colType != null)
            {
                colType.Name = columnTypes.Name;
                colType.Create_Date = DateTime.Now;
                colType.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                columnTypes.Create_Date = DateTime.Now;
                columnTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Column_Types.Add(columnTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult ColumnShapes(Column_Shapes columnShapes)
        {
            var entities = new LaneEntities();
            var colShapes = entities.Column_Shapes.FirstOrDefault(x => x.Column_Shape_ID == columnShapes.Column_Shape_ID);
            if (colShapes != null)
            {
                colShapes.Name = columnShapes.Name;
                colShapes.Create_Date = DateTime.Now;
                colShapes.Created_By = WebSecurity.CurrentUserId;
            }
            else
            {
                columnShapes.Create_Date = DateTime.Now;
                columnShapes.Created_By = WebSecurity.CurrentUserId;
                entities.Column_Shapes.Add(columnShapes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult DeckStyles(Deck_Styles deckStyles)
        {
            var entities = new LaneEntities();
            var deck = entities.Deck_Styles.FirstOrDefault(x => x.Deck_Style_ID == deckStyles.Deck_Style_ID);
            if (deck != null)
            {
                deck.Name = deckStyles.Name;
                deck.Create_Date = DateTime.Now;
                deck.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                deckStyles.Create_Date = DateTime.Now;
                deckStyles.Created_By = WebSecurity.CurrentUserId;
                entities.Deck_Styles.Add(deckStyles);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult FasciaTypes(Fascia_Types fasciaTypes)
        {
            var entities = new LaneEntities();
            var fascia = entities.Fascia_Types.FirstOrDefault(x => x.Fascia_Type_ID == fasciaTypes.Fascia_Type_ID);
            if (fascia != null)
            {
                fascia.Name = fasciaTypes.Name;
                fascia.Create_Date = DateTime.Now;
                fascia.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                fasciaTypes.Create_Date = DateTime.Now;
                fasciaTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Fascia_Types.Add(fasciaTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        [HttpPost]
        public ActionResult Drainage(Drainage_Types drainageTypes)
        {
            var entities = new LaneEntities();
            var drainage = entities.Drainage_Types.FirstOrDefault(x => x.Drainage_Type_ID == drainageTypes.Drainage_Type_ID);
            if (drainage != null)
            {
                drainage.Name = drainageTypes.Name;
                drainage.Create_Date = DateTime.Now;
                drainage.Created_By = WebSecurity.CurrentUserId;
                entities.SaveChanges();
            }
            else
            {
                drainageTypes.Create_Date = DateTime.Now;
                drainageTypes.Created_By = WebSecurity.CurrentUserId;
                entities.Drainage_Types.Add(drainageTypes);
                entities.SaveChanges();
            }
            return RedirectToAction("Maintenance");
        }

        protected override JsonResult Json(object data, string contentType, System.Text.Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            return new JsonNetResult
            {
                Data = data,
                ContentType = contentType,
                ContentEncoding = contentEncoding,
                JsonRequestBehavior = behavior
            };
        }
    }
}
