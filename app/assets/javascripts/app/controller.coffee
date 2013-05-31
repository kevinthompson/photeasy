define ['marionette', 'layout'], (Marionette, Layout) ->
  class Controller extends Marionette.Controller
    showRoot: ->
      require ['views/photos'], (PhotosPage) ->
        photoView = new PhotosPage()
        Layout.main.show photoView
        photoView.collection.fetch()

    showShare: (id) ->
      require ['views/photos', 'collection/share'], (PhotosPage, ShareCollection) ->
        photoView = new PhotosPage()
        Layout.main.show new PhotosPage
          collection: new ShareCollection(id: id)
        photoView.collection.fetch()

    show404: ->
      require ['views/404'], (NotFoundView)->
        Layout.main.show new NotFoundView()

    ignoreRoute: ->
      return false

  return new Controller
