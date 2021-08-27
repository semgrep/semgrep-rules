var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs($scope.html);

     input = $scope.html
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs(input);

     input = $scope.html
     sce_alias = $sce
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs(input);

     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsJs('stringLiteral');
   };

});

var app1 = angular.module('MyApp', []);
app1.some_other_function('myCtrl', function() {

$scope.userInput = 'foo';
    $scope.sayHello = function($scope, $sce) {
     // $sce is present but not in the function args
     $scope.trustedurl = $sce.trustAsJs($scope.html);

  };

});

// Another controller style
var app = angular.module('MyApp', []);
app.controller('myCtrl',['$scope','$sce','$document', function($scope, $sce, $document) {

$scope.userInput = 'foo';
    $scope.sayHello = function() {
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs($scope.html);

     input = $scope.html
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs(input);

     input = $scope.html
     sce_alias = $sce
     // ruleid:detect-angular-trust-as-js-method
     $scope.trustedurl = $sce.trustAsJs(input);


     //Data is not coming from user input
     $scope.trustedurl = $sce.trustAsJs('stringLiteral');
   };

}]);
