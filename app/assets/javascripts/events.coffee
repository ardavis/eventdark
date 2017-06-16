ready = ->
  $('.datetimepicker').datetimepicker()

$(document).on('turbolinks:load', ready)