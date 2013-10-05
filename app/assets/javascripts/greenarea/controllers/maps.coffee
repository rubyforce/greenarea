greenarea.controller 'MapsController', [
  '$scope', '$element', 'EstatesMap'
  ($scope, $element, EstatesMap) ->
    $scope.markers = $element.data('markers')

    $scope.google = EstatesMap.settings({}, $scope.markers)
    $scope.google.settings.mapTypeControlOptions = false
    $scope.google.settings.disableDefaultUI = true
    $scope.isOpened = false

    $scope.$on 'map-refresh', ->
      $scope.google.refresh = !$scope.google.refresh

    $scope.show = ->
      $scope.isOpened = true

      $scope.google.settings.mapTypeControlOptions =
        mapTypeIds: [
          'grayMap',
          google.maps.MapTypeId.TERRAIN,
          google.maps.MapTypeId.SATELLITE,
          google.maps.MapTypeId.HYBRID
        ],
        position: google.maps.ControlPosition.RIGHT_BOTTOM
      $scope.google.settings.disableDefaultUI = false
      $scope.google.refresh = !$scope.google.refresh

      # mapTypeControlOptions: (open ? false : mTCO)
    $scope.close = ->
      $scope.isOpened = false
      $scope.google.settings.mapTypeControlOptions = false
      $scope.google.settings.disableDefaultUI = true
      $scope.google.refresh = !$scope.google.refresh
]

