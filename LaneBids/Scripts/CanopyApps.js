(function () {

    var app = angular.module('CanopyViewer', ['ngTouch']);

    var CanopyController = function ($scope, $compile, canopyHttpService) {

        var onCanopyError = function (response) {
            $scope.error = "Error getting data.";
        };

        $scope.columnLengthCount = 1;

        $scope.addColumnLength = function() {
            $scope.columnLengthCount += 1;
            var addLength = "<div class='measurementListColumn'> " +
                "<input type='number' id='colLenFeet" + $scope.columnLengthCount + "' " +
                " ng-model='canopyDetail.ColumnLengths.Feet' /> Feet " +
                "<input type='number' id='colLenInch" + $scope.columnLengthCount + "' " +
                "ng-model='canopyDetail.ColumnLengths.Inches' />  Inches " +
                "<img ng-click='deleteColumnLength($event)' class='ui-state-highlight ui-icon ui-icon-circle-close measure-icon' />" +
                "</div>";

            var newMeasurement = $compile(addLength)($scope);

            $("#LengthColumns").append(newMeasurement);
        };

        $scope.addSameColumnLenght = function () {
            $scope.columnLengthCount += 1;
            var lastDiv = $("#ColumnLengh").find('div.measurementList').last();
            var feet = lastDiv.first('input').val();
            var inch = lastDiv.last('input').val();

            var addLength = "<div class='measurementListColumn'> " +
                "<input type='number' id='colLenFeet" + $scope.columnLengthCount + "' " +
                "value='" + feet + "' " +
                "ng-model='canopyDetail.ColumnLengths.Feet' /> Feet " +
                "<input type='number' id='colLenInch" + $scope.columnLengthCount + "' " +
                "value='" + inch + "' " +
                "ng-model='canopyDetail.ColumnLengths.Inches' />  Inches " +
                "<img ng-click='deleteColumnLength($event)' class='ui-state-highlight ui-icon ui-icon-circle-close measure-icon' />" +
                "</div>";

            $("#LengthColumns").append(addLength);
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
