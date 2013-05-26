define ['marionette', 'utils/vent', 'views/layout/header', 'regions/alert', 'regions/pages'], (Marionette, vent, HeaderView, AlertRegion, PagesRegion) ->
  class Layout extends Marionette.Layout
    el: '#wrap'

    regions:
      header: '#header'
      # alert: AlertRegion
      main: PagesRegion
      footer: '#footer'
      modal: '#modal'

    onRender: ->
      @header.show new HeaderView()

    initialize: ->
      vent.on 'alert', (options) =>
        @showAlert(options)

    showAlert: (options) ->
      require ['views/layout/alert'], (AlertView) =>
        @alert.show new AlertView(options)

  return new Layout()
