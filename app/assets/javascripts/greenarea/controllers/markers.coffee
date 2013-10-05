greenarea.controller 'MarkersController', [
  '$scope', '$element', '$http', '$rootScope'
  ($scope, $element, $http, $rootScope) ->
    # TODO: place here things to upload photos to s3 and place things to create
    # marker using $http service in the app/models/project.rb
    $scope.submit = ->
      # TODO: replace somehow Settings global variable for the current lng things.
      # !!!
      $scope.project.latitude = Settings.latitude
      $scope.project.longitude = Settings.longitude

      $http.post('/projects', project: $scope.project)
        .success (project) ->
          $rootScope.$broadcast('new-marker', project)
          $.gritter.add
            image: Settings.gritter.success.image
            title: Settings.gritter.success.title
            text: "Successfully create the new marker"
        .error ->
          $.gritter.add
            image: Settings.gritter.error.image
            title: Settings.gritter.error.title
            text: "Error on create the new marker"
]

