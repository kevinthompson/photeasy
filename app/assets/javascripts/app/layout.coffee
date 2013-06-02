define [
  'base'
  'marionette'
  'utils/event_bus'
  'views/layout/header'
  'regions/overlay'
], (
  Base
  Marionette
  EventBus
  HeaderView
  OverlayRegion
) ->
  class Layout extends Marionette.Layout
    el: 'body'

    regions:
      header:
        selector: '#header'
        regionType: Base.Region

      main:
        selector: '#main'
        regionType: Base.Region

      footer: '#footer'
      overlay: OverlayRegion
      popOver: '#pop-over'

    onRender: ->
      @header.show new HeaderView()

  return new Layout()
