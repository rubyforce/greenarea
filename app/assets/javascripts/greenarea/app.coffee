@greenarea = angular.module('greenarea', ['ng-rails-csrf', 'rails', 'ui'])

$(document).on 'ready page:change', ->
  angular.bootstrap(document, ['greenarea'])

