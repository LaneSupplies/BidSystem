(function () {

    var app = angular.module('AdminService');

    var SalesPersonController = function ($scope, adminHttpService) {

        $scope.salesPerson = {};
        //$scope.salesPerson.PhoneContacts = [];
        $scope.salesPersonList = [];

        var onError = function (response) {
            $scope.error = "There was an error. Error: " + response;
        };

        $scope.salesPerson.PhoneContacts = {
            Phones: [
                {
                    Id: '',
                    Number: ''
                }
            ]
        };

        //Get Sales People List
        var onSalesPeopleComplete = function(data) {
            $scope.salesPersonList = data;
        }

        //Get Common Lists
        var onCommonLists = function (data) {
            $scope.stateList = data.States;
            $scope.contactTypes = data.ContactTypes;
            $scope.numContract = { Id: "1" };
            $scope.salesPerson = {
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
        }

        var onAddSalesPersonComplete = function (data) {
            $scope.salesPersonList.push({
                Name: data.data.Name,
                Code: data.data.Code,
                AddressString: data.data.AddressString
            });

            $('.message-info').text('Successfully Saved Sales Person');
            $('.message-info').toggle();
            $('#salesPersonModal').modal('hide');
        };

        //Add Sales Person
        $scope.addSalesPerson = function () {
            adminHttpService.getLists().then(onCommonLists, onError);
            $('#addSalesPersonLabel').text("Add Sales Person");
            $('#salesPersonModal').modal('show');
        }

        //Create Sales Person
        $scope.createSalesPerson = function (salesPerson) {
            adminHttpService.addSalesPerson(salesPerson).then(onAddSalesPersonComplete, onError);
        }

        //Edit Sales Person
        $scope.editSalesPerson = function (salesPerson) {
            $scope.salesPerson = salesPerson;
            $('#addSalesPersonLabel').text("Edit Sales Person");
            $('#salesPersonModal').modal('show');
        }

        //Add Contact Line
        $scope.addContact = function() {
            $scope.salesPerson.PhoneContacts.Phones.push({});
        }
        
        adminHttpService.getSalesPeople().then(onSalesPeopleComplete, onError);
    };

    app.controller("SalesPersonController", SalesPersonController);

}());


