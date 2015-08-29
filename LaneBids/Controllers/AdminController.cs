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
                    case TypeDataEnum.FaciaTypes:
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
        public ActionResult CreateTypeData(TypeDataModel model)
        {
            
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
