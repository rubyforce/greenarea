@greenarea = angular.module('greenarea', ['ng-rails-csrf', 'rails', 'ui'])

$(document).on 'ready page:change ajax-ready', ->
  angular.bootstrap(document, ['greenarea'])

