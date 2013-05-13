define ['marionette', 'utils/vent', 'views/layout/navigation', 'regions/alert', 'regions/main'], (Marionette, vent, NavigationView, AlertRegion, MainRegion) ->
  class Layout extends Marionette.Layout
    el: '#wrap'

    regions:
      header: '#header'
      navigation: '#navigation'
      alert: AlertRegion
      main: MainRegion
      footer: '#footer'
      modal: '#modal'

    onRender: ->
      @navigation.show new NavigationView()

    initialize: ->
      vent.on 'alert', (options) =>
        @showAlert(options)

    showAlert: (options) ->
      require ['views/layout/alert'], (AlertView) =>
        @alert.show new AlertView(options)

  return new Layout()
