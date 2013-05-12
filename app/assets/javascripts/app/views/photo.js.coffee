define ['marionette', 'dusty!photo'], (Marionette, template) ->
  class PhotoView extends Marionette.ItemView
    tagName: 'li'
    template: template

    onRender: ->
      @$('img').load => @onImageLoad()

    onImageLoad: (event) ->
      @$('.photo').addClass 'loaded'
