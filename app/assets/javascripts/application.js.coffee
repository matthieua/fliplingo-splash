#= require jquery
#= require jquery.transit
#= require_tree .

$ ->
    $('input[type=submit]').one 'mouseenter', ->
      $email = $(event.currentTarget).siblings('.email:hidden').first()
      if $email.length
        width  = $email.width()

        $email.css('width', 0).show().transition({ 'width': width }, 250, 'snap').focus()

