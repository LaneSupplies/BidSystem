(function () {

    var app = angular.module('CanopyViewer', ['ngTouch']);

    var CanopyController = function ($scope, $compile, canopyHttpService) {

        var onCanopyError = function (response) {
            $scope.error = "Error getting data.";
        };

        //Column Lengths
        $scope.canopyDetail = {};
        $scope.canopyDetail.ColumnLengths = {};
        $scope.canopyDetail.ColumnLengths = {
            measurements: [{
                feet: '',
                inches: ''
            }]
        };
        $scope.addColumnLength = function () {
            $scope.canopyDetail.ColumnLengths.measurements.push({});
        };

        $scope.addSameColumnLenght = function (length) {

            $scope.canopyDetail.ColumnLengths.measurements.push({
                feet: length.feet,
                inches: length.inches
            });
        };

        $scope.deleteColumnLength = function (index) {
            $scope.canopyDetail.ColumnLengths.measurements.splice(index, 1);
        };

        //Columns Widths
        $scope.canopyDetail.ColumnWidths = {
            measurements: [{
                feet: '',
                inches: ''
            }]
        };
        $scope.addColumnWidth = function () {
            $scope.canopyDetail.ColumnWidths.measurements.push({});
        };

        $scope.addSameColumnWidth = function (width) {

            $scope.canopyDetail.ColumnWidths.measurements.push({
                feet: width.feet,
                inches: width.inches
            });
        };

        $scope.deleteColumnWidth = function (index) {
            $scope.canopyDetail.ColumnWidths.measurements.splice(index, 1);
        };

        $scope.submitForm = function(canopyDetail) {
            alert(canopyDetail);
        }

        //canopyHttpService.getContacts().then(onContactListComplete, onCanopyError);
        //canopyHttpService.getStateList().then(onStateListComplete, onCanopyError);
    };

    app.controller("CanopyController", CanopyController);
}());
