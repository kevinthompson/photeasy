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

    $form.addClass('fold-down')
    $success.addClass('slide-down')

    # $.post $form.attr('action'), $form.serialize()
