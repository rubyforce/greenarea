greenarea.controller 'SubscriptionsController', [
  '$scope', '$http', '$timeout'
  ($scope, $http, $timeout) ->
    $scope.submit = (event) ->
      $http.post('/subscriptions', email: $scope.email).success (data) ->
        $timeout ->
          $scope.$apply ->
            $scope.email = ''
            $.gritter.add
              image: Settings.gritter.success.image
              title: Settings.gritter.success.title
              text:data.message
        , 10
]

