floatEqual = (f1, f2) -> Math.abs(f1 - f2) < 0.000001

greenarea.directive 'esGoogleMap', [
  '$timeout',
  ($timeout) ->
    link = ($scope, $element, $attributes) ->
      zoom = $scope.options.zoom
      dragging = $scope.options.dragging
      center = new google.maps.LatLng($scope.options.center.latitude, $scope.options.center.longitude)

      # we are applying google maps for the root element of the directive
      container = $element[0]
      options =
        container: container
        center: center

      _instance = new google.maps.Map(container, angular.extend($scope.options, options))

      # setup custom styles
      styledMap = new google.maps.StyledMapType($scope.styles[$scope.styles.id], { name: $scope.styles.name })
      _instance.mapTypes.set($scope.styles.id, styledMap)
      _instance.setMapTypeId($scope.styles.id)

      # setup refresh event
      $scope.$watch 'refresh', (value) =>
        _instance.setOptions
          mapTypeControlOptions: $scope.options.mapTypeControlOptions
          disableDefaultUI: $scope.options.disableDefaultUI
        google.maps.event.trigger(_instance, "resize")

        if $scope.options.center.latitude? && $scope.options.center.longitude?
          center = new google.maps.LatLng($scope.options.center.latitude, $scope.options.center.longitude)

        _instance.setCenter(center)

        $timeout ->
          center = _instance.getCenter()
          google.maps.event.trigger(_instance, "resize")
          _instance.setCenter(center)

      addMarker = (m) ->
        marker = new google.maps.Marker
          position: new google.maps.LatLng(m.latitude, m.longitude)
          map: _instance
          center: new google.maps.LatLng(m.latitude, m.longitude)
          icon: m.icon
        markers.push(marker)
        m.infoWindow.map = _instance
        info = new InfoBubble(m.infoWindow.settings)
        google.maps.event.addListener marker, 'click', ->
          currentInfoWindow.close() if currentInfoWindow?
          info.open(_instance, marker)
          currentInfoWindow = info

      markers = []
      # add markers to the map with InfoBubble info window.
      for m in $scope.options.markers
        addMarker(m)

      if $scope.extra.fit && markers.length > 1
        bounds = new google.maps.LatLngBounds()
        for m in markers
          bounds.extend(m.getPosition())
        _instance.fitBounds(bounds)
        _instance.setCenter(bounds.getCenter())

      google.maps.event.addListener _instance, "dragstart", ->
        dragging = true

      google.maps.event.addListener _instance, "idle", ->
        dragging = false

      google.maps.event.addListener _instance, "drag", ->
        dragging = true

      google.maps.event.addListener _instance, "zoom_changed", ->
        zoom = _instance.getZoom()
        center = _instance.getCenter()

      google.maps.event.addListener _instance, "center_changed", ->
        center = _instance.getCenter()

      google.maps.event.addListener _instance, 'drag', ->
        $timeout ->
          $scope.$apply ->
            $scope.options.center.latitude = center.lat()
            $scope.options.center.longitude = center.lng()

      google.maps.event.addListener _instance, "center_changed", ->
        $timeout ->
          $scope.$apply ->
            if !dragging
              $scope.options.center.latitude = center.lat()
              $scope.options.center.longitude = center.lng()

      google.maps.event.addListener _instance, "zoom_changed", ->
        if $scope.options.zoom != zoom
          $timeout ->
            $scope.$apply ->
              $scope.options.zoom = zoom;

    return {
      restrict: 'ECA'
      priority: 100
      transclude: true
      template: "<div class='angular-google-map' ng-transclude></div>"
      scope:
        options: '=options'
        styles: '=styles'
        refresh: '=refresh'
        extra: '=extra'
      replace: false
      link: link
    }
]

