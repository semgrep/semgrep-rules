var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-css-method
     // Semgrep removed this dangerous method: $sce.trustAsCss
     input = $scope.html
     // ruleid:detect-angular-trust-as-css-method
     // Semgrep removed this dangerous method: $sce.trustAsCss


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsCss('stringLiteral');
   };

});
