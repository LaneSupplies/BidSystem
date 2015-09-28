(function () {
    var app = angular.module("AdminService", ['ngTouch', 'ui.grid', 'ui.bootstrap', 'cgPrompt']);
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
        ////////////////////////
        // Data Types //////////
        ////////////////////////
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


        /////////////////////////
        // Sales People /////////
        /////////////////////////
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
        
        ////////////////////////
        // Contacts ///////////
        ///////////////////////
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

        /////////////////////
        // State List ///////
        ////////////////////
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

        /////////////////////
        // Companies ////////
        ////////////////////
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

        var getCompanyList = function(data) {
            return $http.get("/api/CompanyList/")
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Error getting company list", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished getting company list");
                });
        }

        /////////////////////
        // Customers ////////
        ////////////////////
        var getCustomers = function () {
            return $http.get("/api/Customer/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Error getting customers", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting custgomers");
                });
        };

        var addCustomer = function (data) {
            return $http.post("/api/Customer/", data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding customer", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding customer");
                });
        };

        var updateCustomer = function (data) {
            return $http.put("/api/Customer/" + data.CustomerId, data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
                .success(function (response) {
                    return response;
                })
                .catch(function (response) {
                    console.log("Error adding customer", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished adding customer");
                });
        };

        var deleteCustomer = function (data) {
            return $http.delete("/api/Customer/" + data.CustomerId)
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

        var getCustomerList = function (data) {
            return $http.get("/api/CustomerList/")
                .then(function (response) {
                    return response.data;
                })
                .catch(function (response) {
                    console.log("Error getting customer list", response.status, response.data);
                })
                .finally(function () {
                    console.log("Finished getting customer list");
                });
        }

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
            deleteCompany: deleteCompany,
            getCustomers: getCustomers,
            addCustomer: addCustomer,
            updateCustomer: updateCustomer,
            deleteCustomer: deleteCustomer,
            getCompanyList: getCompanyList,
            getCustomerList: getCustomerList
        };
    };

    var module = angular.module("AdminService");
    module.factory("adminHttpService", adminHttpService);
    
}());
