var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-resourceurl-method
     // Semgrep removed this dangerous method: $sce.trustAsResourceUrl
     input = $scope.html
     // ruleid:detect-angular-trust-as-resourceurl-method
     // Semgrep removed this dangerous method: $sce.trustAsResourceUrl


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsResourceUrl('stringLiteral');
   };

});
