(function () {

    var app = angular.module('AdminService');

    var CompanyController = function ($scope, adminHttpService) {

        $scope.rowIndex = 0;

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

        var onUpdateComplete = function (data) {
            $scope.companyList[$scope.rowIndex].Name = data.data.Name;
            //_.defer(function () { $scope.$apply(); });

            $('.message-info').text('Successfully Updated Company');
            $('.message-info').toggle();
            $('#companyModal').modal('hide');
        }

        var onDeleteComplete = function (data) {
            $scope.companyList.splice($scope.rowIndex, 1);
            $('.message-info').text('Successfully Deleted Company');
            $('.message-info').toggle();
        }

        //Add Company
        $scope.addCompany = function () {
            $('#addCompanyLabel').text("Add Company");
            $('#companyModal').modal('show');
        }

        //Create Company
        $scope.createUpdateCompany = function (company) {
            if ($scope.company.hasOwnProperty('CompanyId')) {
                adminHttpService.updateCompany(company).then(onUpdateComplete, onError);
            } else {
                adminHttpService.addCompany(company).then(onAddCompanyComplete, onError);
            }
            
        }

        //Edit Company 
        $scope.editCompany = function (company, index) {
            $scope.rowIndex = index;
            $scope.company = company;
            $('#addCompanyLabel').text("Edit Company");
            $('#companyModal').modal('show');
        }

        $scope.deleteCompany = function (company, index) {
            $scope.rowIndex = index;
            adminHttpService.deleteCompany(company).then(onDeleteComplete, onError);
        }

        adminHttpService.getCompanies().then(onCompanyComplete, onError);

    };

    app.controller("CompanyController", CompanyController);

}());


