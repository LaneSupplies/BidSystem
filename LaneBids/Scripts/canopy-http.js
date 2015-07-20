(function () {

    var canopyHttpService = function ($http) {
        var transform = function (data) {
            console.log($.param(data));
            return $.param(data);
        };

        

        return {
            
        };
    };

    var appHttp = angular.module("CanopyViewer");
    appHttp.factory("canopyHttpService", canopyHttpService);

    //appHttp.config(function ($httpProvider) {
    //    $httpProvider.defaults.transformRequest = function (data) {
    //        if (data === undefined) {
    //            return data;
    //        }
    //        return $.param(data);
    //    }
    //});
}());
