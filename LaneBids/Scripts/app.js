(function() {

    var app = angular.module('localServiceViewer', ['ngTouch', 'ui.grid']);

    var MaintController = function($scope, localService) {

        var onTypeDataComplete = function(data) {
            $scope.getTypeData = data;
        };

        var onTypeDataError = function(reason) {
            $scope.error = "Could not get type data.";
        };

        localService.getTypeData("StructureType").then(onTypeDataComplete, onTypeDataError);
        
    };

    app.controller("MaintController", MaintController);

}());

$(function () {
    $('#divTypeDataModal').dialog({
        autoOpen: false,
        height: 238,
        width: 465,
        resizable: false,
        title: "Edit Type"
    });

    $(".type-modal").click(function (event) {
        event.preventDefault();

        $.ajax({
            url: event.currentTarget.href,
            type: 'POST',
            dataType: 'html',
            success: function (data) {
                $("#divTypeDataModal").html(data);
                $("#divTypeDataModal").dialog("open");
            }
        });

        //$('#divTypeDataModal').dialog();
    });
});

$("#update-type-modal").click(function (ev) {
    ev.preventDefault();
    var form = $("#update-type-modal-form");

    $.ajax({
        url: '/Admin/TypeDataUpdate',
        type: 'POST',
        data: form.serialize(),
        dataType: 'json',
        success: function (data) {
            alert(data);
        }
    });

});

$("#cancel-type-modal").click(function (ev) {
    $("#divTypeDataModal").dialog("close");
});
