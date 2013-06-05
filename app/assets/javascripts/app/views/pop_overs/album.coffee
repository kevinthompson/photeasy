define [
  'base'
  'dusty!album_pop_over'
], (
  Base
  template
) ->

  class AlbumPopOver extends Base.ItemView
    template: template
    className: 'album-pop-over'
    collection: new Base.Collection
    templateHelpers: =>
      photoCount: =>
        plural = if @collection.length == 1 then '' else 's'
        return "#{@collection.length} Photo#{plural}"

    eventPrefix: 'album'

    events:
      'click button': 'onShareClick'

    onShareClick: (event) ->
      event.preventDefault()
      @eventBus.trigger 'overlay:show', 'share'
      @unsetState 'show'

    busEvents:
      'photo:state:set:selected': 'addPhoto'
      'photo:state:unset:selected': 'removePhoto'
      'request:photos': 'sendPhotos'
      'overlay:closed': 'show'

    show: ->
      @setState 'show'

    sendPhotos: (callback) ->
      console.log 'sent photos'
      callback @collection

    photoAction: (photo, action) ->
      @collection[action] photo.model
      @eventBus.trigger "album:#{action}", photo
      return @

    addPhoto: (photo) ->
      @photoAction photo, 'add'
      return @

    removePhoto: (photo) ->
      @photoAction photo, 'remove'
      return @

    initialize: ->
      @collection.on 'add remove', =>
        if @collection.length > 0 then @render()
        @eventBus.trigger 'album:update', @
        if @collection.length > 0 and !@hasState 'show'
          @setState 'show'
        else if !@collection.length
          @unsetState 'show'
      super
