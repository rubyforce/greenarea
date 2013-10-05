greenarea.controller 'ProjectController', [
  '$scope', '$element', '$compile', '$http', '$timeout', '$window', 'EstatesMap'
  ($scope, $element, $compile, $http, $timeout, $window, EstatesMap) ->
    $scope.project = $element.data('project')
]

