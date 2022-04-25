var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope,$sanitize) {
    $scope.value = grabInput()
    $rootScope.value = grabInput()
    // ruleid: detect-angular-element-methods
    angular.element('div').html($scope.value)
    // ok: detect-angular-element-methods
    angular.element('div').html('hi')
    // ruleid: detect-angular-element-methods
    angular.element('div').html($rootScope.value)
});
