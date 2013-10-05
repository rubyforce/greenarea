greenarea.controller 'ProjectsController', [
  '$scope', '$element', '$compile', '$http', '$timeout', '$window', 'EstatesMap'
  ($scope, $element, $compile, $http, $timeout, $window, EstatesMap) ->
    # initialize tabs
    $scope.projectTab = 1

    $scope.project = $element.data('project')
    $scope.urls = $element.data('urls')

    # setup google maps events
    $scope.google = EstatesMap.settings({}, [$scope.project])

    # setup tab click function
    $scope.openTab = (event, variable, step) ->
      event.preventDefault()
      $scope[variable] = step

    # user selected location tab that mean we need to refresh map
    $scope.$watch 'projectTab==3', ->
      $scope.$broadcast('map-refresh')

    $scope.$on 'map-refresh', ->
      $scope.google.refresh = !$scope.google.refresh
]

