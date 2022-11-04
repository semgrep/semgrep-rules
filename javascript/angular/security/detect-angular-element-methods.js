var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope,$sanitize) {
    $rootScope.foo = getData();
    $scope.foo = getData();
    // ok: detect-angular-element-methods
    angular.element('div').html('hi')
    // We're telling Semgrep that *every* occurrence of $rootScope is tainted,
    // we need to write the rule in a different way!
    // todook: detect-angular-element-methods
    angular.element('div').html($rootScope.foo)
    // ok: detect-angular-element-methods
    angular.element('div').html($scope.foo)
    // ruleid: detect-angular-element-methods
    angular.element('div').html($rootScope)
    // ruleid: detect-angular-element-methods
    angular.element('div').html($scope)
});
