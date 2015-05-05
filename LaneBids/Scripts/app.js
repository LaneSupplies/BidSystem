(function () {

    var app = angular.module("localServiceViewer", ["ngRoute"]);

    app.config(function ($routeProvider) {
        $routeProvider
            .when("Admin/TypeData", {
                templateUrl: "_TypeDataModel.cshtml",
                controller: "MaintenanceController"
            })
            .when("Admin/TypeDataEdit/:", {
                templateUrl: "user.html",
                controller: "UserController"
            })
            .when("/repo/:username/:reponame", {
                templateUrl: "repo.html",
                controller: "RepoController"
            })
            .otherwise({ redirectTo: "/main" });
    });

}());