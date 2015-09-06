(function () {

    var app = angular.module('AdminService');

    var SalesPersonController = function ($scope, adminHttpService) {

        $scope.salesPerson = {};

        var onError = function (response) {
            $scope.error = "There was an error. Error: " + response;
        };

        $scope.salesPerson.PhoneNumbers = {
            contacts: [
                {
                    Id: '',
                    Number: ''
                }
            ]
        };

        //Get contact list
        var onContactListComplete = function (data) {
            $scope.contacts = data;
        };

        //Get state list
        var onStateListComplete = function (data) {
            $scope.stateList = data;
        };

        var onAddSalesPersonComplete = function (data) {
            $scope.salesPersonList.push({
                salesPerson: [{
                    Name: data.Name,
                    Code: data.Code,
                    Address: data.Address
                }]
            });

            $('.message-info').text('Successfully Saved Sales Person');
            $('.message-info').toggle();
            $('#salesPersonModal').modal('hide');
        };

        //Add Sales Person
        $scope.addSalesPerson = function () {
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
            $scope.salesPerson.PhoneNumbers.contacts.push({});
        }
        
        adminHttpService.getContacts().then(onContactListComplete, onError);
        adminHttpService.getStateList().then(onStateListComplete, onError);
    };

    app.controller("SalesPersonController", SalesPersonController);

}());


