(function () {

    var app = angular.module('AdminService');

    var CompanyController = function ($scope, adminHttpService) {

        var onError = function (response) {
            $scope.error = "There was an error. Error: " + response;
        };

        
        //Get Company List
        var onCompanyComplete = function(data) {
            $scope.companyList = data;
        }

        var onAddCompanyComplete = function (data) {
            $scope.companyList.push({
                Name: data.data.Name
            });

            $('.message-info').text('Successfully Saved Company');
            $('.message-info').toggle();
            $('#companyModal').modal('hide');
        };

        //Add Company
        $scope.addCompany = function () {
            $('#addCompanyLabel').text("Add Company");
            $('#companyModal').modal('show');
        }

        //Create Company
        $scope.createCompany = function (company) {
            adminHttpService.addCompany(company).then(onAddCompanyComplete, onError);
        }

        //Edit Company 
        $scope.editCompany = function (company) {
            $scope.company = company;
            $('#addCompanyLabel').text("Edit Company");
            $('#companyModal').modal('show');
        }

        adminHttpService.getCompanies().then(onCompanyComplete, onError);

    };

    app.controller("CompanyController", CompanyController);

}());


