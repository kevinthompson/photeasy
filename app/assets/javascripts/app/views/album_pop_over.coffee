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

    eventPrefix: 'album'

    busEvents:
      'photo:state:set:selected': 'addPhoto'
      'photo:state:unset:selected': 'removePhoto'

    initialize: ->
      @collection.on 'add remove', =>
        if @collection.length > 0 then @render()
        @eventBus.trigger 'album:update', @
        if @collection.length > 0 and !@hasState 'show'
          @setState 'show'
        else if !@collection.length
          @unsetState 'show'
      super()

    photoAction: (photo, action) ->
      @collection[action] photo.model
      @eventBus.trigger "album:#{action}", photo
      return @

    addPhoto: (photo) -> @photoAction photo, 'add'

    removePhoto: (photo) -> @photoAction photo, 'remove'

    templateHelpers: =>
      photoCount: =>
        plural = if @collection.length == 1 then '' else 's'
        return "#{@collection.length} Photo#{plural}"
