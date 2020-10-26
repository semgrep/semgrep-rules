var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-html-method
     $scope.trustedurl = $sce.trustAsHtml($scope.html);
     // ruleid:detect-angular-trust-as-html-method
     input = $scope.html
     $scope.trustedurl = $sce.trustAsHtml(input);


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsJs('stringLiteral');
   };

});
