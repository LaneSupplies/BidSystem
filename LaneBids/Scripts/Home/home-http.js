(function () {
    var app = angular.module("HomeService", ['ngTouch', 'ui.grid', 'ui.bootstrap', 'cgPrompt']);


    var homeHttpService = function ($http) {
        var transform = function (data) {
            //console.log($.param(data));
            return $.param(data);
        };

        ///////////////////////////////////
        // Create Contact Lists ///////////
        ///////////////////////////////////
        var getLists = function () {
            return $http.get("/api/CreateContactLists/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("List Error: ", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting lists.");
                });
        };

        var addCustomer = function(data) {
            return $http.post("/Home/AddCustomer/", data, {
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                    transformRequest: transform
                })
                .success(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Error adding customer", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished adding customer");
                });
        };

        var addSite = function(data) {
            return $http.post("/Home/AddSite/", data, {
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                    transformRequest: transform
                })
                .success(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Error adding site", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished adding site");
                });
        };

        var addShippingInfo = function(data) {
            return $http.post("/Home/AddShipping/", data, {
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                    transformRequest: transform
                })
                .success(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Error adding shipping info", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished adding shipping info");
                });
        };

        var getSalesPeople = function () {
            return $http.get("/api/SalesPerson/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Error adding sales person", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding sales person");
                });
        };

        var createCanopy = function (data) {
            return $http.post('/Home/InsertCanopy/', data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
            .success(function (response) {
                return response.data;
            })
            .catch(function (response) {
                console.log("Error adding canopy", response.status, response.data);
            })
            .finally(function () {
                console.log("Finished adding canopy");
            });
        }
        
        return {
            getLists: getLists,
            addCustomer: addCustomer,
            addSite: addSite,
            addShippingInfo: addShippingInfo,
            getSalesPeople: getSalesPeople,
            createCanopy: createCanopy
        };
    };

    var module = angular.module("HomeService");
    module.factory("homeHttpService", homeHttpService);

}());
