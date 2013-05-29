#= require jquery
#= require_self

$ ->
  $main = $('#main')
  $form = $main.find('form')
  $input = $form.find('input')
  $button = $form.find('button')
  $success = $('#success')

  $form.on 'submit', (event) ->
    event.preventDefault()

    unless $input.val() == ''
      $button.addClass 'loading'
      post = $.post($form.attr('action'), $form.serialize())
      post.success (response) ->
        unless response.errors.length
          $main.addClass 'success'

      post.error (response) ->
        response = JSON.parse(response.responseText)
        if response.errors[0].indexOf('already subscribed')
          $main.addClass 'already-subscribed'
        else
          $main.addClass 'error'

