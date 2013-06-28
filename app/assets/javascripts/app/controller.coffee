define ['marionette', 'layout'], (Marionette, Layout) ->
  class Controller extends Marionette.Controller
    showRoot: ->
      require [
        'views/photos'
        'views/pop_overs/album'
      ], (
        PhotosPage
        AlbumPopOver
      ) ->
        photoView = new PhotosPage
        photoView.collection.fetch()
        Layout.main.show photoView
        Layout.popOver.show new AlbumPopOver

    show404: ->
      require ['views/404'], (NotFoundView)->
        Layout.main.show new NotFoundView

    test: ->
      require ['views/forms/pill'], (PillInput) ->
        Layout.main.show new PillInput

    ignoreRoute: ->
      return false

  return new Controller
