(function () {
    var app = angular.module("AdminService", ['ngTouch', 'ui.grid']);
    //app.config(function ($httpProvider) {
    //    $httpProvider.defaults.transformRequest = function (data) {
    //        if (data === undefined) {
    //            return data;
    //        }
    //        return $.param(data);
    //    }
    //});

    var adminHttpService = function ($http) {
        var transform = function(data) {
            return $.param(data);
        };

        var getTypeData = function() {
            return $http.get("/Admin/TypeData/")
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished getting grid data.");
                });
        };

        var editTypeData = function(id, typeName) {
            return $http.get("/Admin/TypeDataEdit/" + id + "/" + typeName)
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                    return response.data;
                })
                .finally(function() {
                    console.log("Finished getting edit data.");
                });
        };

        var updateTypeData = function(data) {
            return $http.post("/Admin/TypeDataUpdate/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
                })
                .success(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished updating data.");
                });
        };

        var deleteTypeData = function(data) {
            return $http.post("/Admin/TypeDataDelete/" + data)
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished deleting data.");
                });
        };

        var addNewDataType = function (data) {
            return $http.post("/Admin/CreateTypeData/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Error adding new data type", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding new data type");
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

        var addSalesPerson = function (data) {
            return $http.post("/api/SalesPerson/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding sales person", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding sales person");
                });
        };

        var getContacts = function () {
            return $http.get("/api/ContactTypes/")
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
            return $http.get("/api/StateList/")
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

        return {
            getStateList: getStateList,
            getContacts: getContacts,
            getTypeData: getTypeData,
            editTypeData: editTypeData,
            updateTypeData: updateTypeData,
            deleteTypeData: deleteTypeData,
            addNewDataType: addNewDataType,
            addSalesPerson: addSalesPerson,
            getSalesPeople: getSalesPeople
        };
    };

    var module = angular.module("AdminService");
    module.factory("adminHttpService", adminHttpService);
    
}());
