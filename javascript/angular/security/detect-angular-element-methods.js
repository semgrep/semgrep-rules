var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope,$sanitize) {
    $rootScope.foo = getData();
    $scope.foo = getData();
    // ok: detect-angular-element-methods
    angular.element('div').html('hi')
    // ruleid: detect-angular-element-methods
    angular.element('div').html($rootScope.foo)
    // ruleid: detect-angular-element-methods
    angular.element('div').html($scope.foo)
});
