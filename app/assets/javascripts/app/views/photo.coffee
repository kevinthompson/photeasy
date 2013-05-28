define ['marionette', 'dusty!photo', 'utils/vent'], (Marionette, template, vent) ->
  class PhotoView extends Marionette.ItemView
    tagName: 'li'
    template: template

    onRender: ->
      @$image = @$('img')
      @$photo = @$('.photo')

      @$image.on 'load', => @onImageLoad()

      src = @$image.data 'pt-src'
      @$image.attr 'src', src

      @$el.on 'click', =>
        # @showItemDetail()
        @selectPhoto()

    onImageLoad: (event) ->
      @$photo.addClass 'loaded'

    showItemDetail: ->
      vent.trigger 'photo-detail', @model

    selectPhoto: ->
      if @$photo.hasClass 'selected'
        @$photo.removeClass 'selected'
        vent.trigger 'photo-removed', @model
      else
        @$photo.addClass 'selected'
        vent.trigger 'photo-selected', @model
