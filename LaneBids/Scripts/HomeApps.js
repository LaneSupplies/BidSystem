(function () {

    var app = angular.module('HomeViewer', ['ngTouch']);

    var HomeController = function ($scope, homeHttpService) {

        var onContactListComplete = function (data) {
            $scope.contacts = data;
            //$scope.customer.contact = $scope.contacts[1];
            //$scope.customer.contact = $scope.contacts[1];
        };

        var onAddCustomerComplete = function(data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#CustomerId").append(newOption);
            $("#divAddCustomer").modal("hide");
        };

        var onHomeError = function (response) {
            $scope.error = "Error getting data.";
        };

        //Get contact list
        $scope.showAddCustomer = function () {
            $("#divAddCustomer").modal("show");
        }

        //Add Customer
        $scope.addCustomer = function(customer) {
            homeHttpService.addCustomer(customer)
                .then(onAddCustomerComplete, onHomeError);
        }

        homeHttpService.getContacts().then(onContactListComplete, onHomeError);
    };

    app.controller("HomeController", HomeController);
}());
