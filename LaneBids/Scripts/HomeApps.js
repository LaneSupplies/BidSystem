(function () {

    var app = angular.module('HomeViewer', ['ngTouch']);

    var HomeController = function ($scope, homeHttpService) {

        $scope.customer = [];

        var onContactListComplete = function (data) {
            $scope.contacts = data;
            $scope.customer.contact = $scope.contacts[1];
            //$scope.customer.contact = $scope.contacts[1];
        };

        var onAddCustomerComplete = function(data) {
            $scope.addedCustomer = data;
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
