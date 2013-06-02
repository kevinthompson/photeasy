define [
  'base'
  'dusty!album_pop_over'
], (
  Base
  template
) ->

  class AlbumPopOver extends Base.ItemView
    className: 'album-pop-over'
    collection: new Base.Collection([], {api: 'albums'})
    template: template
    templateHelpers: =>
      photoCount: =>
        plural = if @collection.length == 1 then '' else 's'
        return "#{@collection.length} Photo#{plural}"

    initialize: ->
      @collection.on 'add remove', =>
        if @collection.length > 0 then @render()
        @eventBus.trigger 'album:update', @
        if @collection.length > 0 and !@hasState 'show'
          @setState 'show'
        else if !@collection.length
          @unsetState 'show'
      super

    # events
    eventPrefix: 'album'
    events:
      'click button': 'onShareClick'
    busEvents:
      'photo:state:set:selected': 'addPhoto'
      'photo:state:unset:selected': 'removePhoto'

    # event handlers
    onShareClick: (event) ->
      event.preventDefault()
      @collection.save()

    # bus event handlers
    photoAction: (photo, action) ->
      @collection[action] photo.model
      @eventBus.trigger "album:#{action}", photo
      return @
    addPhoto: (photo) -> @photoAction photo, 'add'
    removePhoto: (photo) -> @photoAction photo, 'remove'

