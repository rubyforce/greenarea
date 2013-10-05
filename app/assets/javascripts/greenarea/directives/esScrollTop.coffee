greenarea.directive 'esScrollTop', ->
  link = ($scope, $element) ->
    $element.on 'click', ->
      $('html, body').animate({ scrollTop: '0px' }, 300)

  return {
    restrict: 'A'
    link: link
    replace: false
  }
