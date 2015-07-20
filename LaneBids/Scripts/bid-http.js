(function () {

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

        var addSalesPerson = function(data) {
            return $http.post("/Home/AddSalesPerson/", data, {
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                    transformRequest: transform
                })
                .success(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Error adding sales person", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished adding sales person");
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

        return {
            getContacts: getContacts,
            getStateList: getStateList,
            addCustomer: addCustomer,
            addSalesPerson: addSalesPerson,
            addSite: addSite,
            addShippingInfo: addShippingInfo
        };
    };

    var appHttp = angular.module("BidViewer");
    appHttp.factory("bidHttpService", bidHttpService);

    //appHttp.config(function ($httpProvider) {
    //    $httpProvider.defaults.transformRequest = function (data) {
    //        if (data === undefined) {
    //            return data;
    //        }
    //        return $.param(data);
    //    }
    //});
}());
