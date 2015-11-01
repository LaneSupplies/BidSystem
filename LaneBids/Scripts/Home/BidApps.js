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
                PhoneContacts: {
                    Phones: [
                        {
                            Id: '',
                            Number: ''
                        }
                    ]
                }
            }
            $scope.initialize();
        }

        //Set default dropdowns in bids page
        $scope.initialize = function () {
            $('select').each(function () {
                var selection = $(this);
                var hasSelection = false;
                selection.find('option').each(function (index, element) {
                    if ($(element).is("[selected]")) {
                        hasSelection = true;
                        return true;
                    }
                });
                if (!hasSelection) {
                    selection.val('None').prop('selected', 'selected');
                }
            });
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
