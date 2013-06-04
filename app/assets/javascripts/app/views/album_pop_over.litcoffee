# Album Pop Over

---

#### Requires
* Base ItemView
* Album Pop Over Template

    define [
      'base'
      'dusty!album_pop_over'
    ], (
      Base
      template
    ) ->

---

This is the element that appears at the bottom of the screen when a user is creating an album. This view is responsible for creating and submiting the album information. It also keeps track of how many photos have been added to the album for the user.

      class AlbumPopOver extends Base.ItemView
        template: template
        className: 'album-pop-over'

Here the view initializes an empty collection and sets it up to use the albums api.

        collection: new Base.Collection([], {api: 'albums'})

The photoCount helper handles displaying the length of the collection for the user and determines if photos should be plural.

        templateHelpers: =>
          photoCount: =>
            plural = if @collection.length == 1 then '' else 's'
            return "#{@collection.length} Photo#{plural}"

## Events

---

The eventPrefix property both enables state events and namepaces them.

        eventPrefix: 'album'

Standard Backbone eventing.

        events:
          'click button': 'onShareClick'

        onShareClick: (event) ->
          event.preventDefault()
          @collection.save()

### Global Bus Events

---

The pop over listens for when a photo is selected/unselected then calls the add and remove methods to add the photo's model to the collection.

        busEvents:

          'photo:state:set:selected': 'addPhoto'
          'photo:state:unset:selected': 'removePhoto'

The photo action method is an abstract way of handling collection actions.

        photoAction: (photo, action) ->
          @collection[action] photo.model
          @eventBus.trigger "album:#{action}", photo
          return @

The add and remove photo methods consume the photo action api. This was done in the pursuit of DRY.

        addPhoto: (photo) ->
          @photoAction photo, 'add'
          return @

        removePhoto: (photo) ->
          @photoAction photo, 'remove'
          return @

## Construction

---

        initialize: ->

When a photo is added or removed from the collection. When there are no photos in the collection, the pop over hides and returns when there are photos in the collection.

          @collection.on 'add remove', =>
            if @collection.length > 0 then @render()
            @eventBus.trigger 'album:update', @
            if @collection.length > 0 and !@hasState 'show'
              @setState 'show'
            else if !@collection.length
              @unsetState 'show'

          return @
