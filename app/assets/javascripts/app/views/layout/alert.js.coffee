define ['marionette', 'dusty!layout/alert', 'utils/vent'], (Marionette, template, vent) ->
  class AlertView extends Marionette.ItemView
    template: template

    events:
      'click': 'close'

    initialize: (options) ->
      @options = options

    serializeData: ->
      return @options

    onRender: ->
      @height = height = @el.clientHeight
      vent.trigger('alert:open', {height: height})

    onClose: ->
      height = @height
      vent.trigger('alert:close', {height: height})

