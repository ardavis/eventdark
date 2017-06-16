ready = ->
  $('.datetimepicker').datetimepicker()

  $('.quick_rsvp').click (e) ->
    e.preventDefault()

    button = $(this)
    event_id = button.data('event-id')

    $.ajax "/events/#{event_id}/attend",
      method: 'POST',
      dataType: 'script',
      beforeSend: ->
        button.text('...')
      success: (data, text, xhr) ->
        button.text('Added!')
        button.addClass('btn-success')
      error: (xhr, text, error) ->
        button.text('Error... :(')
        button.addClass('btn-danger')
      complete: ->
        button.removeClass('btn-primary')
$(document).on('turbolinks:load', ready)