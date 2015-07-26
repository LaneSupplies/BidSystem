(function () {

    var app = angular.module('CanopyViewer', ['ngTouch']);

    var CanopyController = function ($scope, $compile, canopyHttpService) {

        $scope.ColumnLengths = {feet: ''};

        var onCanopyError = function (response) {
            $scope.error = "Error getting data.";
        };

        $scope.columnLengthCount = 0;

        $scope.addColumnLength = function() {
            $scope.columnLengthCount += 1;
            var addLength = "<div class='measurementListColumn'> " +
                "<input type='number' class='numberOnly feet' " +
                "ng-model='canopyDetail.ColumnLengths[" + $scope.columnLengthCount + "].Feet' /> Feet " +
                "<input type='number' class='numberOnly inches' " +
                "ng-model='canopyDetail.ColumnLengths[" + $scope.columnLengthCount + "].Inches' />  Inches " +
                "<img ng-click='deleteColumnLength($event)' class='ui-icon ui-icon-circle-close measure-icon' />" +
                "</div>";

            var newMeasurement = $compile(addLength)($scope);

            $("#LengthColumns").append(newMeasurement);
        };

        $scope.addSameColumnLenght = function () {
            $scope.columnLengthCount += 1;
            var feet = $('#ColumnLength').find('div.measurementListColumn').last().find('input.feet').val();
            var inch = $('#ColumnLength').find('div.measurementListColumn').last().find('input.inches').val();

            var addLength = "<div class='measurementListColumn'> " +
                "<input type='number' class='numberOnly feet' " +
                "value='" + feet + "' " +
                "ng-model='canopyDetail.ColumnLengths[" + $scope.columnLengthCount + "].Feet' /> Feet " +
                "<input type='number' class='numberOnly inches' " +
                "value='" + inch + "' " +
                "ng-model='canopyDetail.ColumnLengths[" + $scope.columnLengthCount + "].Inches' />  Inches " +
                "<img ng-click='deleteColumnLength($event)' class='ui-icon ui-icon-circle-close measure-icon' />" +
                "</div>";

            var newMeasurement = $compile(addLength)($scope);

            $("#LengthColumns").append(newMeasurement);
        };

        $scope.deleteColumnLength = function ($event) {
            $scope.columnLengthCount -= 1;
            $($event.currentTarget).closest('div').remove();
        };


        //canopyHttpService.getContacts().then(onContactListComplete, onCanopyError);
        //canopyHttpService.getStateList().then(onStateListComplete, onCanopyError);
    };

    app.controller("CanopyController", CanopyController);
}());
