define(["app", "js/factories/AccountFactory"], function (app) {

    app.register.controller("AccountCtrl", function ($scope, AccountFactory) {

        $scope.register = function (registerModel) {
            AccountFactory.register(registerModel).$promise.
                then(function (data) {
                    window.Token = data.Token;
                }).catch(function (error) {
                    alert(error.statusText);
                });
        }; 

        $scope.login = function (loginModel) {
            AccountFactory.login(loginModel).$promise.
               then(function (data) {
                   window.Token = data.Token;
               }).catch(function (error) {
                   alert(error.statusText);
               });
        };
        
    });

});
