define ['marionette', 'layout'], (Marionette, Layout) ->
  class Controller extends Marionette.Controller
    showRoot: ->
      Layout.main.reset()

    showPhotos: ->
      require ['views/photos'], (PhotosView) ->
        Layout.main.show new PhotosView()

    show404: ->
      require ['views/404'], (NotFoundView)->
        Layout.main.show new NotFoundView()

    ignoreRoute: ->
      return false

  return new Controller
