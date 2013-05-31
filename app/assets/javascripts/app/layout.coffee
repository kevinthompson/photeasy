define ['marionette', 'utils/event_bus', 'views/layout/header', 'regions/overlay'], (Marionette, EventBus, HeaderView, OverlayRegion) ->
  class Layout extends Marionette.Layout
    el: '#wrap'

    regions:
      header: '#header'
      main: '#main'
      footer: '#footer'
      overlay: OverlayRegion
      popOver: '#pop-over'

    onRender: ->
      @header.show new HeaderView()

  return new Layout()
