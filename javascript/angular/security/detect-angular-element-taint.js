var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope,$sanitize) {
    let a = unescape(window.location.href)
    // ruleid: detect-angular-element-taint
    angular.element('div').html(a)
    let b = $sanitize(unescape(window.location.href))
    // ok: detect-angular-element-taint
    angular.element('div').html(b)
    let b = window.location.href
    // ruleid: detect-angular-element-taint
    angular.element('div').html((new URLSearchParams(window.location.search)).get('returnUrl'))

});
