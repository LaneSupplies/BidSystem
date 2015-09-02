using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;
using LaneBids.Models;
using LaneBids.Models.Admin;
using LaneBids.Sources;
using WebMatrix.WebData;

namespace LaneBids.Controllers
{
    public class AdminController : Controller
    {

        private AdminServices _services = new AdminServices();

        public ActionResult Maintenance()
        {
            ViewBag.Title = "Admin Maintenance";
            return View();
        }

        #region Create User Page

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
                    if (!Roles.RoleExists(model.LaneUserRole.ToString()))
                    {
                        Roles.CreateRole(model.LaneUserRole.ToString());
                    }
                    var role = model.LaneUserRole.ToString();
                    WebSecurity.CreateUserAndAccount(model.UserName, model.Password, new
                                {
                                    model.Email, 
                                    model.FirstName, 
                                    model.LastName, 
                                    role
                                });

                    Roles.AddUserToRole(model.UserName, model.LaneUserRole.ToString());
                    var currentUserId = WebSecurity.CurrentUserId;
                    WebSecurity.Login(model.UserName, model.Password);

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

        #endregion

        #region Type Data Page

        [HttpGet]
        public JsonResult TypeData()
        {
            var entities = new LaneEntities();
            var model = new TypeDataAllModel {AllTypes = new List<TypeDataGridModel>()};
            foreach (var type in EnumUtil.GetValues<TypeDataEnum>())
            {
                var enumType = typeof (TypeDataEnum);
                var memInfo = enumType.GetMember(type.ToString());
                var attr = memInfo[0].GetCustomAttributes(typeof (DescriptionAttribute), false);
                var displayName = ((DescriptionAttribute) attr[0]).Description;
                var gridModel = new TypeDataGridModel();
                switch (type)
                {
                    case TypeDataEnum.StructureType:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Structure_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Structure_Type_ID,
                                Name = t.Name,
                                Code = "",
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.BidStatus:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Bid_Statuses.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Bid_Status_ID,
                                Name = t.Status,
                                Code = "",
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.BidType:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = true,
                            TypeDataEnum = type,
                            DataTypes = entities.Bid_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Bid_Type_ID,
                                Name = t.Name,
                                Code = t.Code,
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.ColumnTypes:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Column_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Column_Type_ID,
                                Name = t.Name,
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By)
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.DeckStyles:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Deck_Styles.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Deck_Style_ID,
                                Name = t.Name,
                                Code = "",
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.DeckTypes:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Deck_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Deck_Type_ID,
                                Name = t.Name,
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By)
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.Drainage:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Drainage_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Drainage_Type_ID,
                                Name = t.Name,
                                Code = "",
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.FasciaTypes:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Fascia_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Fascia_Type_ID,
                                Name = t.Name,
                                Code = "",
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.JobTypes:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = false,
                            TypeDataEnum = type,
                            DataTypes = entities.Job_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Job_Type_ID,
                                Name = t.Name,
                                Code = t.Code,
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                    case TypeDataEnum.ScopeTypes:
                        gridModel = new TypeDataGridModel
                        {
                            Title = displayName,
                            HasCode = true,
                            TypeDataEnum = type,
                            DataTypes = entities.Scope_Types.ToList().Select(t => new TypeDataModel
                            {
                                ID = t.Scope_Type_ID,
                                Name = t.Name,
                                Code = t.Code,
                                Create_Date = String.Format("{0:d}", t.Create_Date),
                                FullName = UserServices.ConvertUserId(t.Created_By),
                                TypeDataEnum = type
                            }).ToList()
                        };
                        break;
                }
                model.AllTypes.Add(gridModel);
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
                    var structure = entities.Structure_Types.FirstOrDefault(x => x.Structure_Type_ID == model.ID);
                    if (structure != null)
                    {
                        structure.Name = model.Name;
                        structure.Create_Date = DateTime.Now;
                        structure.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.BidStatus:
                    var bidStatus = entities.Bid_Statuses.FirstOrDefault(x => x.Bid_Status_ID == model.ID);
                    if (bidStatus != null)
                    {
                        bidStatus.Status = model.Name;
                        bidStatus.Create_Date = DateTime.Now;
                        bidStatus.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.BidType:
                    var bidType = entities.Bid_Types.FirstOrDefault(x => x.Bid_Type_ID == model.ID);
                    if (bidType != null)
                    {
                        bidType.Name = model.Name;
                        bidType.Create_Date = DateTime.Now;
                        bidType.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.ColumnTypes:
                    var columnTypes = entities.Column_Types.FirstOrDefault(x => x.Column_Type_ID == model.ID);
                    if (columnTypes != null)
                    {
                        columnTypes.Name = model.Name;
                        columnTypes.Create_Date = DateTime.Now;
                        columnTypes.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.DeckStyles:
                    var deckStyles = entities.Deck_Styles.FirstOrDefault(x => x.Deck_Style_ID == model.ID);
                    if (deckStyles != null)
                    {
                        deckStyles.Name = model.Name;
                        deckStyles.Create_Date = DateTime.Now;
                        deckStyles.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.DeckTypes:
                    var deckTypes = entities.Deck_Types.FirstOrDefault(x => x.Deck_Type_ID == model.ID);
                    if (deckTypes != null)
                    {
                        deckTypes.Name = model.Name;
                        deckTypes.Create_Date = DateTime.Now;
                        deckTypes.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.Drainage:
                    var drainage = entities.Drainage_Types.FirstOrDefault(x => x.Drainage_Type_ID == model.ID);
                    if (drainage != null)
                    {
                        drainage.Name = model.Name;
                        drainage.Create_Date = DateTime.Now;
                        drainage.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.FasciaTypes:
                    var fasciaTypes = entities.Fascia_Types.FirstOrDefault(x => x.Fascia_Type_ID == model.ID);
                    if (fasciaTypes != null)
                    {
                        fasciaTypes.Name = model.Name;
                        fasciaTypes.Create_Date = DateTime.Now;
                        fasciaTypes.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.JobTypes:
                    var jobTypes = entities.Job_Types.FirstOrDefault(x => x.Job_Type_ID == model.ID);
                    if (jobTypes != null)
                    {
                        jobTypes.Name = model.Name;
                        jobTypes.Create_Date = DateTime.Now;
                        jobTypes.Created_By = WebSecurity.CurrentUserId;
                    }
                    break;
                case TypeDataEnum.ScopeTypes:
                    var scopeTypes = entities.Scope_Types.FirstOrDefault(x => x.Scope_Type_ID == model.ID);
                    if (scopeTypes != null)
                    {
                        scopeTypes.Name = model.Name;
                        scopeTypes.Create_Date = DateTime.Now;
                        scopeTypes.Created_By = WebSecurity.CurrentUserId;
                    }
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
                    var structure = entities.Structure_Types.FirstOrDefault(x => x.Structure_Type_ID == model.ID);
                    entities.Structure_Types.Remove(structure);
                    break;
                case TypeDataEnum.BidStatus:
                    var bidStatus = entities.Bid_Statuses.FirstOrDefault(x => x.Bid_Status_ID == model.ID);
                    entities.Bid_Statuses.Remove(bidStatus);
                    break;
                case TypeDataEnum.BidType:
                    var bidType = entities.Bid_Types.FirstOrDefault(x => x.Bid_Type_ID == model.ID);
                    entities.Bid_Types.Remove(bidType);
                    break;
                case TypeDataEnum.ColumnTypes:
                    var columnTypes = entities.Column_Types.FirstOrDefault(x => x.Column_Type_ID == model.ID);
                    entities.Column_Types.Remove(columnTypes);
                    break;
                case TypeDataEnum.DeckStyles:
                    var deckStyles = entities.Deck_Styles.FirstOrDefault(x => x.Deck_Style_ID == model.ID);
                    entities.Deck_Styles.Remove(deckStyles);
                    break;
                case TypeDataEnum.DeckTypes:
                    var deckTypes = entities.Deck_Types.FirstOrDefault(x => x.Deck_Type_ID == model.ID);
                    entities.Deck_Types.Remove(deckTypes);
                    break;
                case TypeDataEnum.Drainage:
                    var drainage = entities.Drainage_Types.FirstOrDefault(x => x.Drainage_Type_ID == model.ID);
                    entities.Drainage_Types.Remove(drainage);
                    break;
                case TypeDataEnum.FasciaTypes:
                    var fasciaTypes = entities.Fascia_Types.FirstOrDefault(x => x.Fascia_Type_ID == model.ID);
                    entities.Fascia_Types.Remove(fasciaTypes);
                    break;
                case TypeDataEnum.JobTypes:
                    var jobTypes = entities.Job_Types.FirstOrDefault(x => x.Job_Type_ID == model.ID);
                    entities.Job_Types.Remove(jobTypes);
                    break;
                case TypeDataEnum.ScopeTypes:
                    var scopeTypes = entities.Scope_Types.FirstOrDefault(x => x.Scope_Type_ID == model.ID);
                    entities.Scope_Types.Remove(scopeTypes);
                    break;
            }

            entities.SaveChanges();
            return Content("Success");
        }

        [HttpPost]
        public ActionResult CreateTypeData(TypeDataModel model)
        {
            var entities = new LaneEntities();
            var type = model.TypeDataEnum;
            var enumType = typeof(TypeDataEnum);
            var memInfo = enumType.GetMember(type.ToString());
            var attr = memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);
            var displayName = ((DescriptionAttribute)attr[0]).Description;
            var gridModel = new TypeDataGridModel();
            switch (type)
            {
                case TypeDataEnum.StructureType:
                    var newStructure= new Structure_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Structure_Types.Add(newStructure);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Structure_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Structure_Type_ID,
                            Name = t.Name,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.BidStatus:
                    var newBidStatus = new Bid_Statuses
                    {
                        Status = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Bid_Statuses.Add(newBidStatus);
                    entities.SaveChanges();
                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Bid_Statuses.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Bid_Status_ID,
                            Name = t.Status,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.BidType:
                    var newBidType = new Bid_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Bid_Types.Add(newBidType);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = true,
                        TypeDataEnum = type,
                        DataTypes = entities.Bid_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Bid_Type_ID,
                            Name = t.Name,
                            Code = t.Code,
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.DeckStyles:
                    var newDeckStyles = new Deck_Styles
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Deck_Styles.Add(newDeckStyles);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Deck_Styles.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Deck_Style_ID,
                            Name = t.Name,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.DeckTypes:
                    var newDeckType = new Deck_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Deck_Types.Add(newDeckType);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Deck_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Deck_Type_ID,
                            Name = t.Name,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.Drainage:
                    var newDrainageType = new Drainage_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Drainage_Types.Add(newDrainageType);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Drainage_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Drainage_Type_ID,
                            Name = t.Name,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.FasciaTypes:
                    var newFasciaTypes = new Fascia_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Fascia_Types.Add(newFasciaTypes);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Fascia_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Fascia_Type_ID,
                            Name = t.Name,
                            Code = "",
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.JobTypes:
                    var newJobTypes = new Job_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Job_Types.Add(newJobTypes);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = false,
                        TypeDataEnum = type,
                        DataTypes = entities.Job_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Job_Type_ID,
                            Name = t.Name,
                            Code = t.Code,
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
                case TypeDataEnum.ScopeTypes:
                    var newScopeTypes = new Scope_Types
                    {
                        Name = model.Name,
                        Created_By = WebSecurity.CurrentUserId,
                        Create_Date = DateTime.Now
                    };
                    entities.Scope_Types.Add(newScopeTypes);
                    entities.SaveChanges();

                    gridModel = new TypeDataGridModel
                    {
                        Title = displayName,
                        HasCode = true,
                        TypeDataEnum = type,
                        DataTypes = entities.Scope_Types.ToList().Select(t => new TypeDataModel
                        {
                            ID = t.Scope_Type_ID,
                            Name = t.Name,
                            Code = t.Code,
                            Create_Date = String.Format("{0:d}", t.Create_Date),
                            FullName = UserServices.ConvertUserId(t.Created_By),
                            TypeDataEnum = type
                        }).ToList()
                    };
                    break;
            }

            return Json(gridModel);
        }

        #endregion

        #region Add Sales Person Page

        [HttpPost]
        public ActionResult AddSalesPerson(SalesPersonDetailsModel salesPerson)
        {
            var newSalesPerson = _services.AddSalesPerson(salesPerson);

            return Json(newSalesPerson, JsonRequestBehavior.AllowGet);
        }

        #endregion


        #region Protected Methods

        protected override JsonResult Json(object data, string contentType, Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            return new JsonNetResult
            {
                Data = data,
                ContentType = contentType,
                ContentEncoding = contentEncoding,
                JsonRequestBehavior = behavior
            };
        }

        #endregion
    }
}
