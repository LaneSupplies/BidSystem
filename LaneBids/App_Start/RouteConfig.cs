using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LaneBids
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "MaintenanceEdit",
                url: "{controller}/{action}/{id}/{typeName}",
                defaults: new
                {
                    controller = "Admin",
                    action = "TypeDataEdit",
                    id = UrlParameter.Optional,
                    typeName = UrlParameter.Optional
                }
                );

            routes.MapRoute(
                name: "Maintenance",
                url: "{controller}/{action}/{type}",
                defaults: new
                {
                    controller = "Admin",
                    action = "TypeData",
                    type = UrlParameter.Optional
                }
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}",
                defaults: new {controller = "Home", action = "Index"}
                );

        }
    }
}