(function () {

    var app = angular.module('HomeViewer', ['ngTouch']);

    var HomeController = function ($scope, homeHttpService) {

        var onHomeError = function (response) {
            $scope.error = "Error getting data.";
        };

        //Get contact list
        var onContactListComplete = function (data) {
            $scope.contacts = data;
            
        };

        //Get state list
        var onStateListComplete = function (data) {
            $scope.stateList = data;
            
        };

        $scope.addDefaultsSelectBidPage = function() {
            var defaultStructureType = "<option value='-1' selected > -- Select Structure -- </option>";
            var defaultBidStatus = "<option value='-1' selected > -- Select Status -- </option>";
            var defaultJobType = "<option value='-1' selected > -- Select Job Type -- </option>";
            var defaultScopeType = "<option value='-1' selected > -- Select Scope Type -- </option>";
            var defaultBidType = "<option value='-1' selected > -- Select Bid Type -- </option>";
            var defaultCustomer = "<option value='-1' selected > -- Select Customer -- </option>";
            var defaultSalesPerson = "<option value='-1' selected > -- Select Sales Person -- </option>";
            var defaultSite = "<option value='-1' selected > -- Select Site -- </option>";
            var defaultShipping = "<option value='-1' selected > -- Select Shipping Info -- </option>";

            $("#StructureId").append(defaultStructureType);
            $("#BidStatusId").append(defaultBidStatus);
            $("#JobTypeId").append(defaultJobType);
            $("#ScopeTypeId").append(defaultScopeType);
            $("#BidTypeId").append(defaultBidType);
            $("#CustomerId").append(defaultCustomer);
            $("#SalesPersonId").append(defaultSalesPerson);
            $("#ShippingId").append(defaultShipping);
            $("#SiteId").append(defaultSite);
        }

        //Add Customer
        $scope.showAddCustomer = function () {
            $("#divAddCustomer").modal("show");
        }

        $scope.addCustomer = function(customer) {
            homeHttpService.addCustomer(customer)
                .then(onAddCustomerComplete, onHomeError);
        }

        var onAddCustomerComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#CustomerId").append(newOption);
            $("#divAddCustomer").modal("hide");
        };

        //Add Sales Person
        $scope.showAddSalesPerson = function () {
            $("#divAddSalesPerson").modal("show");
        }

        $scope.addSalesPerson = function (salesPerson) {
            homeHttpService.addSalesPerson(salesPerson)
                .then(onAddSalesPersonComplete, onHomeError);
        }

        var onAddSalesPersonComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#SalesPersonId").append(newOption);
            $("#divAddSalesPerson").modal("hide");
        };

        //Add Site
        $scope.showAddSite = function () {
            $("#divAddSite").modal("show");
        }

        $scope.addSite = function (site) {
            homeHttpService.addSite(site)
                .then(onAddSiteComplete, onHomeError);
        }

        var onAddSiteComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#SiteId").append(newOption);
            $("#divAddSite").modal("hide");
        };

        //Add Shipping Info
        $scope.showAddShipping = function () {
            $("#divAddShipping").modal("show");
        }

        $scope.addShippingInfo = function (site) {
            homeHttpService.addShippingInfo(site)
                .then(onAddShippingInfoComplete, onHomeError);
        }

        var onAddShippingInfoComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#ShippingId").append(newOption);
            $("#divAddShipping").modal("hide");
        };

        homeHttpService.getContacts().then(onContactListComplete, onHomeError);
        homeHttpService.getStateList().then(onStateListComplete, onHomeError);
    };

    app.controller("HomeController", HomeController);
}());
