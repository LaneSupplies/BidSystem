(function () {

    var app = angular.module('BidViewer', ['ngTouch']);

    var bidController = function ($scope, bidHttpService) {

        var onBidError = function (response) {
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

        //Set default dropdowns in bids page
        $scope.addDefaultsSelectBidPage = function() {
            var defaultStructureType = "<option value='None' selected > -- Select Structure -- </option>";
            var defaultBidStatus = "<option value='None' selected > -- Select Status -- </option>";
            var defaultJobType = "<option value='None' selected > -- Select Job Type -- </option>";
            var defaultScopeType = "<option value='None' selected > -- Select Scope Type -- </option>";
            var defaultBidType = "<option value='None' selected > -- Select Bid Type -- </option>";
            var defaultCustomer = "<option value='None' selected > -- Select Customer -- </option>";
            var defaultSalesPerson = "<option value='None' selected > -- Select Sales Person -- </option>";
            var defaultSite = "<option value='None' selected > -- Select Site -- </option>";
            var defaultShipping = "<option value='None' selected > -- Select Shipping Info -- </option>";

            $("#StructureId").append(defaultStructureType);
            $("#BidStatusId").append(defaultBidStatus);
            $("#JobTypeId").append(defaultJobType);
            $("#ScopeTypeId").append(defaultScopeType);
            $("#BidTypeId").append(defaultBidType);
            //$("#CustomerId").append(defaultCustomer);
            $("#SalesPersonId").append(defaultSalesPerson);
            $("#ShippingId").append(defaultShipping);
            $("#SiteId").append(defaultSite);
        }

        //Add Customer
        $scope.showAddCustomer = function () {
            $("#divAddCustomer").modal("show");
        }

        $scope.addCustomer = function(customer) {
            bidHttpService.addCustomer(customer)
                .then(onAddCustomerComplete, onBidError);
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
            bidHttpService.addSalesPerson(salesPerson)
                .then(onAddSalesPersonComplete, onBidError);
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
            bidHttpService.addSite(site)
                .then(onAddSiteComplete, onBidError);
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
            bidHttpService.addShippingInfo(site)
                .then(onAddShippingInfoComplete, onBidError);
        }

        var onAddShippingInfoComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#ShippingId").append(newOption);
            $("#divAddShipping").modal("hide");
        };

        bidHttpService.getContacts().then(onContactListComplete, onBidError);
        bidHttpService.getStateList().then(onStateListComplete, onBidError);
    };

    app.controller("BidController", bidController);
}());
