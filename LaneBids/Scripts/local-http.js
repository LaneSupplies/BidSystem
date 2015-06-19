(function () {

    var localService = function ($http) {

        var getTypeData = function(typeName) {
            return $http.get("/Admin/TypeData/?type=" + typeName)
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished getting grid data.");
                });
        };

        var editTypeData = function(id, typeName) {
            return $http.get("/Admin/TypeDataEdit/" + id + "/" + typeName)
                .then(function(response) {
                    $("#typeDataModal").html(response.data);
                    $("#typeDataModal").modal('show');
                    //response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished getting edit data.");
                });
        };

        var updateTypeData = function(data) {
            return $http.post("/Admin/TypeDataUpdate/" + data)
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished updating data.");
                });
        };

        var deleteTypeData = function(data) {
            return $http.post("/Admin/TypeDataDelete/" + data)
                .then(function(response) {
                    return response.data;
                })
                .catch(function(response) {
                    console.log("Type Data Error: ", response.status, response.data);
                })
                .finally(function() {
                    console.log("Finished deleting data.");
                });
        };

        return {
            getTypeData: getTypeData,
            editTypeData: editTypeData,
            updateTypeData: updateTypeData,
            deleteTypeData: deleteTypeData
        };
    };

    var module = angular.module("localServiceViewer");
    module.factory("localService", localService);

}());
