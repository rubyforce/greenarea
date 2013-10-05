greenarea.controller 'InvestmentsController', [
  '$scope', '$element'
  ($scope, $element) ->
    $scope.project = $element.data('project')

    user = $element.data('user')
    $scope.investment =
      address_line_1: user.street
      city: user.city
      country: user.country
      state: user.state
      zip_code: user.zip_code

    $scope.step = (step, event) ->
      event.preventDefault()
      $scope.investButton = step
]

