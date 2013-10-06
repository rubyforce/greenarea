greenarea.factory 'EstatesMap', [
  '$window'
  ($window) ->
    Styles =
      id: 'grayMap'
      name: 'Gray Map'
      grayMap: [
        {
          "stylers": [ { "saturation": -40 }, { "hue": "#ffaa00" } ]
        },{
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [ { "visibility": "simplified" }, { "lightness": 100 } ]
        },{
          "featureType": "road",
          "elementType": "labels",
          "stylers": [ { "visibility": "on" }, { "weight": 0.3 }, { "saturation": -60 } ]
        },{
          "featureType": "poi.park",
          "elementType": "geometry",
          "stylers": [ { "color": "#cadfaa" }, { "saturation": -40 }, { "lightness": 20 } ]
        },{
          "featureType": "landscape.natural",
          "stylers": [ { "color": "#9cdfaa" }, { "saturation": -75 } ]
        },{
          "featureType": "water",
          "elementType": "geometry",
          "stylers": [ { "color": "#a6cade" }, { "saturation": -60 }, { "lightness": -20 }, { "visibility": "simplified" } ]
        },{
          "featureType": "transit.line",
          "stylers": [ { "saturation": -100 }, { "lightness": 20 } ]
        },{
          "featureType": "water",
          "elementType": "labels",
          "stylers": [ { "saturation": -100 } ]
        }
      ]

    host = "#{$window.location.protocol}//#{$window.location.host}"
    MarkerIcon = host + '/images/map_icon.svg'

    # setup center for the google maps
    # by default if we have no at least one invested object or user doesn't
    # have address we will take San Fransisco coordinates for the pointing
    # somewhere.
    SF =
      latitude: 37.7756
      longitude: -122.4193

    @settings = (user, collection) ->
      # configuring google maps here.
      settings = {}

      return { center: SF } unless google?

      icon = new google.maps.MarkerImage(MarkerIcon, null, null, null, new google.maps.Size(18, 26))
      for object in collection
        object.infoWindow =
          type: 'InfoBubble'
          settings:
            maxWidth: 300
            closeButtonClass: 'infobubble-close'
            content: "<h5><a href='/projects/#{object.id}'>#{object.name}</a></h5><p><img src='#{object.image_url}' width=100 height=100 /></p>"
            position: new google.maps.LatLng(object.latitude, object.longitude)
            shadowStyle: false
            padding: 0
            backgroundColor: 'white'
            borderRadius: 0
            arrowSize: 10
            borderWidth: 0
            backgroundClassName: 'infobubble'
            arrowStyle: 0
            disableAnimation: true
        object.icon = icon

      # because of exporting only lng and ltd
      settings.markers = collection

      object = collection[0] || {}

      center =
        latitude:  user.latitude  || object.latitude  || SF.latitude
        longitude: user.longitude || object.longitude || SF.longitude

      settings.center      = center
      settings.zoom        = 16
      settings.minZoom     = 4
      settings.scrollwheel = false
      settings.markClick   = true
      settings.draggable   = true
      settings.disableDefaultUI = false
      settings.mapTypeControlOptions =
        mapTypeIds: [
          'grayMap',
          google.maps.MapTypeId.TERRAIN,
          google.maps.MapTypeId.SATELLITE,
          google.maps.MapTypeId.HYBRID
        ]

      extra =
        fit: true

      return { settings: settings, styles: Styles, extra: extra }

    this
]

