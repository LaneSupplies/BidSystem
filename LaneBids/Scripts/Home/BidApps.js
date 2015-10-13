(function () {

    var app = angular.module('HomeService');

    var bidController = function ($scope, homeHttpService, prompt) {

        var onBidError = function (response) {
            $scope.error = "Error getting data.";
        };

        //Get Common Lists
        var onCommonLists = function (data) {
            $scope.stateList = data.States;
            $scope.contacts = data.ContactTypes;
            $scope.numContract = { Id: "1" };
            $scope.bid = {
                State: data.States[0].Value,
                CompanyId: $scope.companyList[0].CompanyId,
                PhoneContacts: {
                    Phones: [
                        {
                            Id: '',
                            Number: ''
                        }
                    ]
                }
            }
        }

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
                .then(onAddCustomerComplete, onBidError);
        }

        var onAddCustomerComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#CustomerId").append(newOption);
            $("#divAddCustomer").modal("hide");
        };

        //Add Site
        $scope.showAddSite = function () {
            $("#divAddSite").modal("show");
        }

        $scope.addSite = function (site) {
            homeHttpService.addSite(site)
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
            homeHttpService.addShippingInfo(site)
                .then(onAddShippingInfoComplete, onBidError);
        }

        var onAddShippingInfoComplete = function (data) {
            var value = data.data.split('|');
            var newOption = "<option value='" + value[0] + "' selected >" + value[1] + "</option>";
            $("#ShippingId").append(newOption);
            $("#divAddShipping").modal("hide");
        };

        homeHttpService.getLists().then(onCommonLists, onBidError);
    };

    app.controller("BidController", bidController);
}());
