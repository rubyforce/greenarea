$ ->
  $('input.hasDatetimePicker').datepicker
    dateFormat: "dd/mm/yy"
    beforeShow: ->
      setTimeout(->
        $('#ui-datepicker-div').css("z-index", "3000")
      100)

