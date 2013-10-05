greenarea.controller 'ProfileController', [
  '$scope', '$element', '$window', '$compile', '$timeout', '$http'
  ($scope, $element, $window, $compile, $timeout, $http) ->
    $scope.profileTab = 1

    $scope.user     = $element.data('user')
    $scope.projects = $element.data('projects')
    $scope.urls     = $element.data('urls')

    $scope.open = (link) ->
      window.open(link, '_blank')

    $scope.openTab = (event, variable, step) ->
      event.preventDefault()
      $scope[variable] = step
      $scope.$broadcast('map-refresh')
]

