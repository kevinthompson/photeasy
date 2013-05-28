#= require jquery
#= require_self

$ ->
  $main = $('#main')
  $form = $main.find('form')
  $input = $form.find('input')
  $button = $form.find('button')

  $form.on 'submit', (event) ->
    event.preventDefault()
