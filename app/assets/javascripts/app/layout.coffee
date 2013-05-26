define ['marionette', 'utils/vent', 'views/layout/header', 'regions/alert', 'regions/pages', 'regions/overlay'], (Marionette, vent, HeaderView, AlertRegion, PagesRegion, OverlayRegion) ->
  class Layout extends Marionette.Layout
    el: '#wrap'

    regions:
      header: '#header'
      # alert: AlertRegion
      main: PagesRegion
      footer: '#footer'
      overlay: OverlayRegion

    onRender: ->
      @header.show new HeaderView()

    initialize: ->
      vent.on 'alert', (options) =>
        @showAlert(options)

      vent.on 'photo-detail', (options) =>
        console.log options.attributes
        @showPhotoDetail(options)

    showAlert: (options) ->
      require ['views/layout/alert'], (AlertView) =>
        @alert.show new AlertView(options)

    showPhotoDetail: (options) ->
      require ['views/photo_detail'], (PhotoDetailView) =>
        @overlay.show(new PhotoDetailView(options.model))

  return new Layout()
