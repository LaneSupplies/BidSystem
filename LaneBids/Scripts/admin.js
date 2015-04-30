﻿$(function () {
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
    alert("Before Update");
    var form = $("#update-type-modal-form");

    alert(form.serialize());

    $.ajax({
        url: '/Admin/TypeDataUpdate',
        type: 'POST',
        data: form.serialize(),
        dataType: 'html',
        success: function (data) {
            alert("Success Updated");
            alert(data);
        }
    });

});

$("#cancel-type-modal").click(function (ev) {
    $("#divTypeDataModal").dialog("close");
});
