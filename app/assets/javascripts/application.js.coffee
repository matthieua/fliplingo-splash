#= require jquery
#= require jquery.transit
#= require_tree .

$ ->
  $email = $('.email')

  $('input[type=submit]').one 'mouseenter', (event) ->
    if $email.is(':hidden')
      width  = $email.width()

      $email.css('width', 0)
        .show()
        .transition({ 'width': width }, 250, 'snap')
        .focus()

  $('.tweet').hover (event) ->
    $(event.currentTarget).stop().transition({ scale: 1.2 }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).stop().transition({ scale: 1.0 }, 250)

  $('.translate').hover (event) ->
    $(event.currentTarget).stop().transition({ rotate: '-720deg' }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).css('rotate', 0)

  $('.publish').hover (event) ->
    $(event.currentTarget).stop().transition({ skewX: '10deg', scale: 1.1 }, 500, 'easeInOutQuad')
  , (event) ->
    $(event.currentTarget).stop().transition({ skewX: '0deg', scale: 1 }, 250)



