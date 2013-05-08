define (require) ->
  Marionette = require('marionette')
  Layout = require('layout')

  class Controller extends Marionette.Controller
    showRoot: ->
      Layout.main.reset()

    showPhotos: ->
      console.log 'photos'
      require ['views/photos'], (PhotosView) ->
        Layout.main.show new PhotosView()

    show404: ->
      console.log '404'
      require ['views/404'], (NotFoundView)->
        Layout.main.show new NotFoundView()

  return new Controller
