greenarea.controller 'DashboardController', [
  '$scope', '$element'
  ($scope, $element) ->
    $scope.user = $element.data('user')
    $scope.projects = $element.data('projects')

    $scope.openTab = (event, variable, step) ->
      event.preventDefault()
      $scope[variable] = step
      $scope.$broadcast('map-refresh')
]

