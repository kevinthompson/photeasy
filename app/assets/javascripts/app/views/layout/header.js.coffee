define ['marionette', 'dusty!layout/header'], (Marionette, template) ->
  class HeaderView extends Marionette.ItemView
    tagName: 'nav'
    template: template
