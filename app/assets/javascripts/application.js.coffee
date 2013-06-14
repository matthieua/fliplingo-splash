#= require jquery
#= require jquery.transit
#= require_tree .


isValidEmail = (email) ->
    pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i)
    pattern.test email

$ ->
  # Animations
  $('.tweet').hover (event) ->
    $(event.currentTarget).stop().transition({ scale: 1.2 }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).stop().transition({ scale: 1 }, 250)

  $('.translate').hover (event) ->
    $(event.currentTarget).stop().transition({ rotate: '-360deg' }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).css('rotate', 0)

  $('.publish').hover (event) ->
    $(event.currentTarget).stop().transition({ skewX: '10deg', scale: 1.1 }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).stop().transition({ skewX: '0deg', scale: 1 }, 250)

  # Notification form
  $form  = $('.notification')
  $email = $form.find('.email')
  $btn   = $form.find('.btn')

  $btn.one 'mouseenter', (event) ->
    if $email.is(':hidden')
      width  = $email.width()

      $email.css('width', 0)
        .show()
        .transition({ 'width': width }, 250, 'snap')
        .focus()

  $email.on 'keypress', ->
    $email.removeClass 'error'

  $form.on 'submit', (event) ->
    event.preventDefault()
    if isValidEmail $email.val()
      $form.hide()
      $('.thanks').fadeIn()
      $.post '/invites', $form.serialize(), (data) ->
        console.log data.created

    else
      $form.stop()
        .transition({ x: -10 }, 75, 'ease')
        .transition({ x: 10 },  75, 'ease')
        .transition({ x: -10 }, 75, 'ease')
        .transition({ x: 10 },  75, 'ease')
        .transition({ x: -10 }, 75, 'ease')
        .transition { x: 0 },   50, 'ease', ->
          $email.focus().addClass('error')
