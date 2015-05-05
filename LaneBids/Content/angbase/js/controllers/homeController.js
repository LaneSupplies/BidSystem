define(["app", "js/factories/HomeFactory"], function (app) {

    app.register.controller("HomeCtrl", function ($scope, HomeFactory) {

        $scope.title = "home controller";
        $scope.htmlSample = "<p>html test texti</p>";
        $scope.birthDate = new Date("July 21, 1983 01:15:00");
        $scope.many = 300;


        $scope.contact = function (contactModel) {
            console.log(contactModel);
            HomeFactory.contact(contactModel).$promise.
                then(function (data) {
                    alert("success");
                }).catch(function (error) {
                    alert(error.config.url + " " + error.statusText);
                });
        };

    });

});
