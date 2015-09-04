(function() {

    var app = angular.module('AdminService', ['ngTouch', 'ui.grid' ]);

    var MaintController = function ($scope, adminHttpService) {

        //$scope.AllTypeData = [];
        $scope.DataTypeIndex = 0;

        var onTypeDataComplete = function(data) {
            $scope.AllTypeData = data;
        };

        var onTypeDataError = function (response) {
            $scope.error = "Could not get type data.";
        };

        var onEditDataType = function (response) {
            $scope.typeData = response;
            $('#typeDataModalLabel').text(response.TypeName);
            $("#typeDataModal").modal('show');
        };

        var onEditErrorDataType = function(response) {
            $scope.error = "Could not Edit the type data";
        }

        var onUpdateDataType = function(response) {
            adminHttpService.getTypeData("StructureType")
                        .then(onTypeDataComplete, onTypeDataError);
            $("#typeDataModal").modal('hide');
            location.reload();
        }

        var onAddNewDataTypeComplete = function (data) {
            angular.copy(data.data, $scope.AllTypeData.AllTypes[$scope.DataTypeIndex].gridModel);
            $('.message-info').text('Successfully Saved New Data type');
            $('.message-info').toggle();
            $('#addTypeDataModal').modal('hide');
        };

        var onAddSalesPersonComplete = function (data) {
            $scope.salesPerson = data;
            $('.message-info').text('Successfully Saved Sales Person');
            $('.message-info').toggle();
        };

        //Edit Data Type in Grid
        $scope.editTypeData = function(item) {
            //adminHttpService.editTypeData(item.ID, item.TypeDataEnum)
            //            .then(onEditDataType, onEditErrorDataType);
            onEditDataType(item);
        }

        //Delete Data Type in Grid
        $scope.deleteTypeData = function (item) {
            adminHttpService.deleteTypeData(item)
                        .then(onUpdateDataType, onTypeDataError);
        }

        //Update Data Type in Grid
        $scope.updateTypeData = function (typeData) {
            adminHttpService.updateTypeData(typeData)
                        .then(onUpdateDataType, onTypeDataError);
        }

        //Add Data Type
        $scope.addTypeData = function (item, index) {
            $scope.DataTypeIndex = index;
            $scope.typeData = item;
            $('#addtypeDataModalLabel').text("Add " + item.Title);
            $('#addTypeDataModal').modal('show');
        }

        //Create New Type Data
        $scope.createTypeData = function(item) {
            adminHttpService.addNewDataType(item)
                .then(onAddNewDataTypeComplete, onTypeDataError);
        }

        //Add Sales Person
        $scope.addSalesPerson = function () {
            $('#addSalesPersonLabel').text("Add Sales Person");
            $('#salesPersonModal').modal('show');

            //adminHttpService.addSalesPerson(salesPerson)
            //    .then(onAddSalesPersonComplete, onTypeDataError);
        }

        //Create Sales Person
        $scope.createSalesPerson = function(salesPerson) {
            
        }

        //Edit Sales Person
        $scope.editSalesPerson = function(salesPerson) {
            $scope.salesPerson = salesPerson;
            $('#addSalesPersonLabel').text("Edit Sales Person");
            $('#salesPersonModal').modal('show');
        }

        adminHttpService.getTypeData("StructureType").then(onTypeDataComplete, onTypeDataError);
    };
    
    app.controller("MaintController", MaintController);

}());


