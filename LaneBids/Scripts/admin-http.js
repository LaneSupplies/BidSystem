﻿(function () {

    var adminHttpService = function ($http) {
        var transform = function(data) {
            return $.param(data);
        };

        var getTypeData = function(typeName) {
            return $http.get("/Admin/TypeData/?type=" + typeName)
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

        var addSalesPerson = function (data) {
            return $http.post("/Admin/AddSalesPerson/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
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
            getTypeData: getTypeData,
            editTypeData: editTypeData,
            updateTypeData: updateTypeData,
            deleteTypeData: deleteTypeData,
            addSalesPerson: addSalesPerson,
            addNewDataType: addNewDataType
        };
    };

    var appHttp = angular.module("AdminService");
    appHttp.factory("adminHttpService", adminHttpService);

    appHttp.config(function($httpProvider) {
        $httpProvider.defaults.transformRequest = function(data) {
            if (data === undefined) {
                return data;
            }
            return $.param(data);
        }
    });
}());
