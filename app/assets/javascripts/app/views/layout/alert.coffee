define ['marionette', 'dusty!layout/alert', 'utils/vent'], (Marionette, template, vent) ->
  class AlertView extends Marionette.ItemView
    template: template

    events:
      'click': 'close'

    initialize: (options) ->
      @options = options

    serializeData: ->
      return @options
