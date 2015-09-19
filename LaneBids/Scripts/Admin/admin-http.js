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
                    console.log("Error getting persons", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting sales persons");
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

        var getCompanies = function () {
            return $http.get("/api/Company/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Error getting companies", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting companies");
                });
        };

        var addCompany = function (data) {
            return $http.post("/api/Company/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding company", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding company");
                });
        };

        var updateCompany = function (data) {
            return $http.put("/api/Company/" + data.CompanyId, data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding company", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding company");
                });
        };

        var deleteCompany = function (data) {
            return $http.delete("/api/Company/" + data.CompanyId)
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding company", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding company");
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
            getSalesPeople: getSalesPeople,
            getCompanies: getCompanies,
            addCompany: addCompany,
            updateCompany: updateCompany,
            deleteCompany: deleteCompany
        };
    };

    var module = angular.module("AdminService");
    module.factory("adminHttpService", adminHttpService);
    
}());
