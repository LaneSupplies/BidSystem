(function () {

    var canopyHttpService = function ($http) {
        var transform = function (data) {
            console.log($.param(data));
            return $.param(data);
        };

        var createCanopy = function(data) {
            return $http.post('/Home/InsertCanopy/', data, {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                transformRequest: transform
            })
            .success(function(response) {
                return response.data;
            })
            .catch(function (response) {
                console.log("Error adding canopy", response.status, response.data);
            })
            .finally(function () {
                console.log("Finished adding canopy");
            });
        }
        

        return {
            createCanopy: createCanopy
        };
    };

    var appHttp = angular.module("CanopyViewer");
    appHttp.factory("canopyHttpService", canopyHttpService);

}());
