(function() {

    var app = angular.module('AdminService', ['ngTouch', 'ui.grid' ]);

    var MaintController = function ($scope, adminHttpService) {

        $scope.AllTypeData = [];

        var onTypeDataComplete = function(data) {
            $scope.AllTypeData = data;
        };

        var onTypeDataError = function (response) {
            $scope.error = "Could not get type data.";
        };

        var onEditDataType = function (response) {
            $scope.typeData = response;
            $('typeDataModalLabel').text(response.TypeName);
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

        //Edit Data Type in Grid
        $scope.editTypeData = function(item) {
            adminHttpService.editTypeData(item.ID, item.TypeDataEnum)
                        .then(onEditDataType, onEditErrorDataType);
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

        adminHttpService.getTypeData("StructureType").then(onTypeDataComplete, onTypeDataError);
    };
    
    app.controller("MaintController", MaintController);

}());


