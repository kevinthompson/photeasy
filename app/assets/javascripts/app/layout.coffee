define [
  'base'
  'marionette'
  'utils/event_bus'
  'views/layout/header'
  'regions/overlay'
  'regions/pop_over'
], (
  Base
  Marionette
  EventBus
  HeaderView
  Overlay
  PopOver
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
      overlay: Overlay
      popOver: PopOver

    onRender: ->
      @header.show new HeaderView()

  return new Layout()
