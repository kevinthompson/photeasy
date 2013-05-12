define ['marionette', 'dusty!layout/navigation'], (Marionette, template) ->
  class NavigationView extends Marionette.ItemView
    tagName: 'nav'
    template: template
