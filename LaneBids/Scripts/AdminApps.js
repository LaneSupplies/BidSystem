(function() {

    var app = angular.module('localServiceViewer', ['ngTouch', 'ui.grid']);

    var MaintController = function($scope, localService) {

        var onTypeDataComplete = function(data) {
            $scope.getTypeData = data;
        };

        var onTypeDataError = function (response) {
            $scope.error = "Could not get type data.";
        };

        var onEditDataType = function(data) {
            $("#divTypeDataModal").html(data);
            $("#divTypeDataModal").dialog("open");
        };

        var onEditErrorDataType = function(response) {
            $scope.error = "Could not Edit the type data";
        }

        var onUpdateDataType = function(response) {
            localService.getTypeData("StructureType")
                .then(onTypeDataComplete, onTypeDataError);
        }

        $scope.editTypeData = function(item) {
            localService.editTypeData(item.ID, item.TypeDataEnum)
                .then(onEditDataType, onEditErrorDataType);
        }

        $scope.updateTypeData = function (item) {
            localService.updateTypeData(item)
                .then(onUpdateDataType, onTypeDataError);
        }

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
            dataType: 'text'
        })
        .done(function(data) {
            alert("Sucess:" + data);
        })
        .fail(function(data) {
            alert("Error: " + data.response);
        });

    $("#divTypeDataModal").dialog("close");
});

$("#cancel-type-modal").click(function (ev) {
    $("#divTypeDataModal").dialog("close");
});
