greenarea.controller 'HomeController', [
  '$scope', 'EstatesMap'
  ($scope, EstatesMap) ->
    $scope.google = EstatesMap.settings({}, [])
    $scope.google.refresh = !$scope.google.refresh
]

