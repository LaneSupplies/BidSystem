(function() {

    var app = angular.module('localServiceViewer', ['ngTouch', 'ui.grid' ]);

    var MaintController = function($scope, localService) {

        var onTypeDataComplete = function(data) {
            $scope.getTypeData = data;
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
            $("#divTypeDataModal").dialog("close");
        }

        $scope.editTypeData = function(item) {
            localService.editTypeData(item.ID, item.TypeDataEnum)
                .then(onEditDataType, onEditErrorDataType);
        }

        $scope.updateTypeData = function (typeData) {
            localService.updateTypeData(typeData)
                .then(onUpdateDataType, onTypeDataError);
        }

        $scope.deleteTypeData = function (item) {
            alert('Delete Data');
            localService.deleteTypeData(item)
                .then(onUpdateDataType, onTypeDataError);
        }

        localService.getTypeData("StructureType").then(onTypeDataComplete, onTypeDataError);
    };
    
    app.controller("MaintController", MaintController);

}());

//angular.module('localServiceViewer').controller('ModalInstanceCtrl', function ($scope, $modalInstance) {

//    $scope.item = function(data) {

//    };

//    $scope.selected = {
//        item: $scope.items[0]
//    };

//    $scope.ok = function () {
//        $modalInstance.close($scope.selected.item);
//    };

//    $scope.cancel = function () {
//        $modalInstance.dismiss('cancel');
//    };
//});
