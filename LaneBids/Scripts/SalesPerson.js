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

        //Get contact list
        var onContactListComplete = function (data) {
            $scope.contacts = data;
            $scope.numContract = { Id: data[0].Value };
        };

        //Get state list
        var onStateListComplete = function (data) {
            $scope.stateOptions = data;
            $scope.salesPerson = {
                State: data[0].Value,
                PhoneContacts: 
                    {
                        Phones: [
                        {
                            Id: '',
                            Number: ''
                        }]
                    }
            };
        };

        var onAddSalesPersonComplete = function (data) {
            $scope.salesPersonList.push({
                Name: data.Name,
                Code: data.Code,
                AddressString: data.AddressString
                
            });

            $('.message-info').text('Successfully Saved Sales Person');
            $('.message-info').toggle();
            $('#salesPersonModal').modal('hide');
        };

        //Add Sales Person
        $scope.addSalesPerson = function () {
            adminHttpService.getContacts().then(onContactListComplete, onError);
            adminHttpService.getStateList().then(onStateListComplete, onError);
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
        
        //adminHttpService.getContacts().then(onContactListComplete, onError);
        //adminHttpService.getStateList().then(onStateListComplete, onError);
    };

    app.controller("SalesPersonController", SalesPersonController);

}());


