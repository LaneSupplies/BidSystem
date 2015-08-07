(function () {

    var app = angular.module('CanopyViewer', ['ngTouch']);

    var CanopyController = function ($scope, $compile, canopyHttpService) {
        $scope.canopyDetail = {};

        var onCanopyError = function (response) {
            $scope.error = "Error getting data.";
        };

        var init = function() {
            var mvcBidId = $("#hiddenBidId").val();
            $scope.canopyDetail.BidId = mvcBidId;
        };

        init();

        //Column Lengths
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

        //Submit Form
        var onAddCanopyComplete = function (data) {
            alert('Saved Canopy');
            //window.location.href = "/Home/Index";
        };

        $scope.submitForm = function (canopyDetail) {
            console.log(canopyDetail);
            canopyHttpService.createCanopy(canopyDetail)
                .then(onAddCanopyComplete, onCanopyError);
        };
        
    };

    app.controller("CanopyController", CanopyController);
}());
