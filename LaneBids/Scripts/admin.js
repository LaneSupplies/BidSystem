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

    $("#update-type-modal").click(function (ev) {
        ev.preventDefault();
        var form = $("update-type-modal-form");

        $.ajax({
            url: '/Admin/TypeDataUpdate',
            data: form.serialize,
            dataType: 'html',
            success: function (data) {
                alert("Updated");
            }
        });

    });

    $("#cancel-type-modal").click(function (ev) {
        $("#divTypeDataModal").dialog("close");
    });
});


