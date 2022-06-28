var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-js-method
     // Semgrep removed this dangerous method: $sce.trustAsJs
     input = $scope.html
     // ruleid:detect-angular-trust-as-js-method
     // Semgrep removed this dangerous method: $sce.trustAsJs


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsJs('stringLiteral');
   };

});
