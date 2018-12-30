clear_text = ->
  $('.clear_on_focus').focus (e) ->
    $(this).val('')
ready = ->
  clear_text()
  $("form[data-remote='true']")
    .on "ajax:beforeSend", ->
      $('.spinner').show()
    .on "ajax:success", ->
      $('.spinner').hide()

$(document).on('turbolinks:load', ready)
