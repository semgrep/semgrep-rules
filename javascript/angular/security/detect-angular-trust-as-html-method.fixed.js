var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-html-method
     // Semgrep removed this dangerous method: $sce.trustAsHtml
     input = $scope.html
     // ruleid:detect-angular-trust-as-html-method
     // Semgrep removed this dangerous method: $sce.trustAsHtml


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsJs('stringLiteral');
   };

});
