define [
  'base'
  'collections/photos'
  'dusty!album_pop_over'
], (
  Base
  PhotosCollection
  template
) ->

  class AlbumPopOver extends Base.ItemView
    template: template
    className: 'album-pop-over'
    collection: new PhotosCollection()

    busEvents:
      'photo:state:set:selected': 'addPhoto'
      'photo:state:unset:selected': 'removePhoto'

    initialize: ->
      @collection.on 'add remove', =>
        @eventBus.trigger 'album:update', @
        console.log 'update album?'
        @render()
      super()
      return @

    photoAction: (photo, action) ->
      @collection[action] photo.model
      @eventBus.trigger "album:#{action}", photo
      return @

    addPhoto: (photo) -> @photoAction photo, 'add'

    removePhoto: (photo) -> @photoAction photo, 'remove'

    templateHelpers: =>
      count: => @collection.length
