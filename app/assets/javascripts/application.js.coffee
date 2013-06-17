#= require jquery
#= require jquery.transit
#= require_tree .


isValidEmail = (email) ->
    pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i)
    pattern.test email

$ ->
  # Notification form
  $form  = $('form')

  $form.find('.btn').on 'mouseenter', (event) ->
    $email = $form.find('.email')
    if $email.is(':hidden')
      $email.off 'mouseenter'
      width  = $email.width()

      $email.css('width', 0)
        .show()
        .transition({ 'width': width }, 250, 'snap')
        .focus()

  $form.find('.email').on 'keypress', (event) ->
    $(event.currentTarget).removeClass 'error'

  $form.on 'submit', (event) ->
    $form = $(event.currentTarget)
    event.preventDefault()
    if isValidEmail $form.find('.email').val()
      $form.hide()
      $('.thanks').fadeIn()
      $.post '/interviewees', $form.serialize(), (data) ->
        # console.log data.created

    else
        $form.stop()
        .transition({ x: -10 }, 75, 'ease')
        .transition({ x: 10 },  75, 'ease')
        .transition({ x: -10 }, 75, 'ease')
        .transition({ x: 10 },  75, 'ease')
        .transition({ x: -10 }, 75, 'ease')
        .transition { x: 0 },   50, 'ease', ->
          $form.find('.email').focus().addClass('error')
