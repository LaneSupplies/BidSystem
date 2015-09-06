using System;
using System.Web;
using System.Web.Optimization;

namespace LaneBids
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();
            AddDefaultIgnorePatterns(bundles.IgnoreList);

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/vendor/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/angularjs").Include(
                "~/Scripts/vendor/bootstrap.js",
                "~/Scripts/vendor/angular.js",
                "~/Scripts/vendor/angular-*",
                "~/Scripts/vendor/ui-grid-unstable.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                "~/Scripts/vendor/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                "~/Scripts/vendor/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/vendor/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/Admin").IncludeDirectory("~/Scripts", "*.js", false));
            bundles.Add(new ScriptBundle("~/bundles/Admin").Include(
                "~/Scripts/admin-http.js",
                "~/Scripts/TypeMaint.js",
                "~/Scripts/SalesPerson.js"));

            bundles.Add(new ScriptBundle("~/bundles/Bid").Include(
                "~/Scripts/BidApps.js",
                "~/Scripts/bid-http.js"));

            bundles.Add(new ScriptBundle("~/bundles/Canopy").Include(
                "~/Scripts/CanopyApps.js",
                "~/Scripts/canopy-http.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/site.css",
                "~/Content/ui-grid-unstable.css"
                //,"~/Content/bootstrap.css"
                //"~/Content/bootstrap-responsive.css",
                //"~/Content/bootstrap-theme.css"
                ));

            bundles.Add(new StyleBundle("~/Content/themes/base/css").IncludeDirectory(
                "~/Content/themes/base", "*.css", true));
        }

        public static void AddDefaultIgnorePatterns(IgnoreList ignoreList)
        {
            if (ignoreList == null)
                throw new ArgumentNullException("ignoreList");
            ignoreList.Ignore("*.intellisense.js");
            ignoreList.Ignore("*-vsdoc.js");
            ignoreList.Ignore("*.debug.js", OptimizationMode.WhenEnabled);
            ignoreList.Ignore("*.min.js", OptimizationMode.WhenDisabled);
            ignoreList.Ignore("*.min.css", OptimizationMode.WhenDisabled);
            ignoreList.Ignore("*.map", OptimizationMode.WhenDisabled);
        }
    }
}