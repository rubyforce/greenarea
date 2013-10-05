$ ->
  $.ajaxSetup
    beforeSend: (xhr) ->
      token = $('meta[name="csrf-token"]').attr('content')
      if token? then xhr.setRequestHeader('X-CSRF-Token', token)

  # setup fancybox for the specific items on the page
	$('.get-in-touch').fancybox
			helpers:
        overlay:
          css:
            'background' : 'rgba(41,41,41, .9)'
      closeBtn: false

