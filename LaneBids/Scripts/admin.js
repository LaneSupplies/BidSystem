﻿var app = angular.module('app', ['ngTouch', 'ui.grid']);

app.controller('MaintenanceController', ['$scope', function ($scope) {

    $scope.myData = [
      {
          "firstName": "Cox",
          "lastName": "Carney",
          "company": "Enormo",
          "employed": true
      },
      {
          "firstName": "Lorraine",
          "lastName": "Wise",
          "company": "Comveyer",
          "employed": false
      },
      {
          "firstName": "Nancy",
          "lastName": "Waters",
          "company": "Fuelton",
          "employed": false
      }
    ];
}]);

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
