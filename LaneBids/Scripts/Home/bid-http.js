(function () {
    var app = angular.module("BidViewer", ['ngTouch']);


    var bidHttpService = function ($http) {
        var transform = function (data) {
            console.log($.param(data));
            return $.param(data);
        };

        var getContacts = function () {
            return $http.get("/Home/ContactList/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Contact List Error: ", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting contacts.");
                });
        };

        var getStateList = function () {
            return $http.get("/Home/StateList/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("State List Error: ", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting contacts.");
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


        return {
            getContacts: getContacts,
            getStateList: getStateList,
            addCustomer: addCustomer,
            addSite: addSite,
            addShippingInfo: addShippingInfo,
            getSalesPeople: getSalesPeople
        };
    };

    var module = angular.module("BidViewer");
    module.factory("bidHttpService", bidHttpService);

}());
