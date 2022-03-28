var app = angular.module('MyApp', []).config(function ($sceDelegateProvider) {
    // ruleid: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist([ '**' ]);

    // ruleid: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://semgrep.dev', '**']);

    // ruleid: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://semgrep.dev', '**', 'http://semgrep.dev']);

    // ruleid: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://**.semgrep.dev']);

    // ok: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://semgrep.dev/ooo']);

    // ok: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://semgrep.dev/**']);

    // ok: detect-angular-resource-loading
    $sceDelegateProvider.resourceUrlWhitelist(['http://semgrep.dev']);

});
 app.controller('myCtrl', function($scope) {

 $scope.userInput = 'foo';
     $scope.sayHello = function() {
      $scope.html = "Hello <b>" + $scope.userInput + "</b>!"

    };

 });
