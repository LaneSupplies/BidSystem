(function () {

    var app = angular.module('AdminService');

    var CustomerController = function ($scope, adminHttpService, prompt) {

        $scope.rowIndex = 0;

        var onError = function (response) {
            $scope.error = "There was an error. Error: " + response;
        };

        //Get Common Lists
        var onCommonLists = function(data) {
            $scope.stateList = data.States;
            $scope.contactTypes = data.ContactTypes;
            $scope.numContract = { Id: "1" };
            $scope.customer = {
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

        //Get Customer List
        var onCustomerComplete = function(data) {
            $scope.customerList = data;
        }

        //Get Company List
        var onCompanyComplete = function (data) {
            $scope.companyList = data;
            adminHttpService.getLists().then(onCommonLists, onError);
        }

        var onAddCustomerComplete = function (data) {
            $scope.customerList.push({
                Name: data.data.Name
            });

            $('.message-info').text('Successfully Saved Customer');
            $('.message-info').toggle();
            $('#customerModal').modal('hide');
        };

        var onUpdateComplete = function (data) {
            $scope.customerList[$scope.rowIndex].Name = data.data.Name;
            //_.defer(function () { $scope.$apply(); });

            $('.message-info').text('Successfully Updated Customer');
            $('.message-info').toggle();
            $('#customerModal').modal('hide');
        }

        var onDeleteComplete = function (data) {
            $scope.customerList.splice($scope.rowIndex, 1);
            $('.message-info').text('Successfully Deleted Customer');
            $('.message-info').toggle();
        }

        //Add Customer
        $scope.addCustomer = function () {
            $('#addCustomerLabel').text("Add Customer");
            $('#customerModal').modal('show');
        }

        //Create Customer
        $scope.createUpdateCustomer = function (customer) {
            if ($scope.customer.hasOwnProperty('CustomerId')) {
                adminHttpService.updateCustomer(customer).then(onUpdateComplete, onError);
            } else {
                adminHttpService.addCustomer(customer).then(onAddCustomerComplete, onError);
            }
            
        }

        //Edit Customer 
        $scope.editCustomer = function (customer, index) {
            $scope.rowIndex = index;
            $scope.customer = customer;
            $('#addCustomerLabel').text("Edit Customer");
            $('#customerModal').modal('show');
        }

        $scope.deleteCustomer = function(customer, index) {
            prompt({
                "title": "Delete Customer",
                "message": "Are you sure you want to delete the customer?",
                "buttons": [
                    {
                        "label": "Yes",
                        "cancel": false,
                        "primary": false
                    },
                    {
                        "label": "No",
                        "cancel": true,
                        "primary": true
                    }
                ]
            }).then(function (result) {
                $scope.rowIndex = index;
                adminHttpService.deleteCustomer(customer).then(onDeleteComplete, onError);
            });

        };

        adminHttpService.getCompanies().then(onCompanyComplete, onError);
        adminHttpService.getCustomers().then(onCustomerComplete, onError);
    };

    app.controller("CustomerController", CustomerController);

}());


