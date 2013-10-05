greenarea.controller 'HomeController', [
  '$scope', '$timeout', 'EstatesMap'
  ($scope, $timeout, EstatesMap) ->
    $scope.google = EstatesMap.settings({}, [])

    $timeout ->
      if navigator.geolocation?
        navigator.geolocation.getCurrentPosition (position) =>
          $scope.google.settings.center.latitude  = position.coords.latitude
          $scope.google.settings.center.longitude = position.coords.longitude

          $scope.$apply ->
            $scope.google.refresh = !$scope.google.refresh
        , =>
          console.log('you got error')
      else
        console.error('not supported')
]

