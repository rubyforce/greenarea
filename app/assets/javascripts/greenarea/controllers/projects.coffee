greenarea.controller 'ProjectsController', [
  '$scope', '$element', '$compile', '$http', '$timeout', '$window', 'EstatesMap'
  ($scope) ->
    $scope.google = EstatesMap.settings({}, [])
]

