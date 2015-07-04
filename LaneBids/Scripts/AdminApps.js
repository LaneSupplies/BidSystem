(function() {

    var app = angular.module('localServiceViewer', ['ngTouch', 'ui.grid' ]);

    var MaintController = function($scope, localService) {

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
            localService.getTypeData("StructureType")
                        .then(onTypeDataComplete, onTypeDataError);
            $("#typeDataModal").modal('hide');
            location.reload();
        }

        //Edit Data Type in Grid
        $scope.editTypeData = function(item) {
            localService.editTypeData(item.ID, item.TypeDataEnum)
                        .then(onEditDataType, onEditErrorDataType);
        }

        //Delete Data Type in Grid
        $scope.deleteTypeData = function (item) {
            localService.deleteTypeData(item)
                        .then(onUpdateDataType, onTypeDataError);
        }

        //Update Data Type in Grid
        $scope.updateTypeData = function (typeData) {
            localService.updateTypeData(typeData)
                        .then(onUpdateDataType, onTypeDataError);
            $("#typeDataModal").modal('hide');

        }

        localService.getTypeData("StructureType").then(onTypeDataComplete, onTypeDataError);
    };
    
    app.controller("MaintController", MaintController);

}());


