(function () {

    var app = angular.module('CanopyViewer', ['ngTouch']);

    var CanopyController = function ($scope, $compile, canopyHttpService) {

        $scope.ColumnLengths = { measurements: [{
            feet: '',
            inches: ''}]
        };

        var onCanopyError = function (response) {
            $scope.error = "Error getting data.";
        };

        //Column Lengths
        $scope.addColumnLength = function () {
            $scope.ColumnLengths.measurements.push({});
        };

        $scope.addSameColumnLenght = function (length) {

            $scope.ColumnLengths.measurements.push({
                feet: length.feet,
                inches: length.inches
            });
        };

        $scope.deleteColumnLength = function (index) {
            $scope.ColumnLengths.measurements.splice(index, 1);
        };

        //Columns Widths

        //canopyHttpService.getContacts().then(onContactListComplete, onCanopyError);
        //canopyHttpService.getStateList().then(onStateListComplete, onCanopyError);
    };

    app.controller("CanopyController", CanopyController);
}());
