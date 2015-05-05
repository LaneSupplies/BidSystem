define(["app"], function () {

    var app = angular.module("angbaseApp", ["ngRoute", "ngResource", "ngDirectiveHelper", "ngFilterHelper"]);

    app.config(function ($routeProvider, $controllerProvider, $provide, $compileProvider, $filterProvider, $httpProvider) {

        app.register = {
            controller: $controllerProvider.register,
            directive: $compileProvider.directive,
            filter: $filterProvider.register,
            factory: $provide.factory,
            service: $provide.service
        };

        $routeProvider.
            when("/", {
                templateUrl: "views/home/index.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/home/about", {
                templateUrl: "views/home/about.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/home/contact", {
                templateUrl: "views/home/contact.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/home/directive", {
                templateUrl: "views/home/directive.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/home/requiredDirective", {
                templateUrl: "views/home/requiredDirective.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController", "js/directives/dateDirective.js", "js/filters/manyFilter"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/home/filter", {
                templateUrl: "views/home/filter.html",
                controller: "HomeCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/homeController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/account/login", {
                templateUrl: "views/account/login.html",
                controller: "AccountCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/accountController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            when("/account/register", {
                templateUrl: "views/account/register.html",
                controller: "AccountCtrl",
                resolve: {
                    load: function ($q, $rootScope) {
                        var defer = $q.defer();
                        require(["js/controllers/accountController"], function () {
                            defer.resolve();
                            $rootScope.$apply();
                        });

                        return defer.promise;
                    }
                }
            }).
            otherwise("/");
    });

    return app;
});