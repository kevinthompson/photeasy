define ['marionette', 'utils/vent'], (Marionette, vent) ->
  class MainRegion extends Marionette.Region
    el: '#main'

    initialize: ->
      # TODO: DRY UP BRO
      vent.on 'alert:open', (event) =>
        @$el.css('padding-top', "+=#{event.height}px")
      vent.on 'alert:close', (event) =>
        console.log event.height
        @$el.css('padding-top', "-=#{event.height}px")

