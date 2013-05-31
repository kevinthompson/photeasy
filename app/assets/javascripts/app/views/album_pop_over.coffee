define ['base', 'collections/photos', 'dusty!album_pop_over'], (Base, PhotosCollection, template) ->
  class AlbumPopOver extends Base.ItemView
    template: template
    collection: new PhotosCollection()
    className: 'album-pop-over'

    busEvents:
      'photo:state:set:selected': 'addPhoto'
      'photo:state:unset:selected': 'removePhoto'

    initialize: ->
      @collection.on 'add remove', =>
        @render()
      @bindBusEvents()

    updateCounter: ->
      @eventBus.trigger 'share:update-count', @collection.length

    addPhoto: (photo) ->
      @collection.add photo.model
      @eventBus.trigger 'share:add-photo', photo
      @updateCounter()

    removePhoto: (photo) ->
      @collection.remove photo.model
      @eventBus.trigger 'share:remove-photo', photo
      @updateCounter()

    templateHelpers: =>
      count: => @collection.length
