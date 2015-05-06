(function () {

    var localService = function ($http) {

        var getTypeData = function (typeName) {
            return $http.get("/Admin/TypeData/" + typeName)
                        .then(function (response) {
                            return response.data;
                        });
        };

        var editTypeData = function (id, typeName) {
            return $http.get("/Admin/TypeDataEdit/" + id + "/" + typeName)
                        .then(function (response) {
                            return response.data;
                        });
        };

        return {
            getTypeData: getTypeData,
            editTypeData: editTypeData
        };
    };

    var module = angular.module("localServiceViewer");
    module.factory("localService", localService);

}());
