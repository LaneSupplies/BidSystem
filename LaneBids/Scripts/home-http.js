(function () {

    var homeHttpService = function ($http) {
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

        var addCustomer = function(data) {
            return $http.post("/Home/CustomerAdd/", data, {
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
        }

        return {
            getContacts: getContacts,
            addCustomer: addCustomer
        };
    };

    var appHttp = angular.module("HomeViewer");
    appHttp.factory("homeHttpService", homeHttpService);

    appHttp.config(function ($httpProvider) {
        $httpProvider.defaults.transformRequest = function (data) {
            if (data === undefined) {
                return data;
            }
            return $.param(data);
        }
    });
}());
