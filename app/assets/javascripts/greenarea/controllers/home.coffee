greenarea.controller 'HomeController', [
  '$scope', '$timeout', '$element', '$rootScope', 'EstatesMap'
  ($scope, $timeout, $element, $rootScope, EstatesMap) ->
    $scope.projects = $element.data('projects')
    $scope.google = EstatesMap.settings({}, $scope.projects)

    $rootScope.$on 'new-marker', (event, project) ->
      $scope.projects.push(project)
      $scope.google = EstatesMap.settings({}, $scope.projects)
      $timeout ->
        $scope.$apply ->
          $scope.google.refresh = !$scope.google.refresh

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

