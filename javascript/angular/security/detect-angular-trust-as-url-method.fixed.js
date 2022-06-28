var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-url-method
     // Semgrep removed this dangerous method: $sce.trustAsURL(...)
     input = $scope.html
     // ruleid:detect-angular-trust-as-url-method
     // Semgrep removed this dangerous method: $sce.trustAsURL(...)


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsUrl('stringLiteral');
   };

});
