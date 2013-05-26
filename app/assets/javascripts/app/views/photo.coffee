define ['marionette', 'dusty!photo'], (Marionette, template) ->
  class PhotoView extends Marionette.ItemView
    tagName: 'li'
    template: template

    onRender: ->
      @$image = @$('img')
      @$photo = @$('.photo')
      @$image.on 'load', => @onImageLoad()
      @onScroll()
      $(window).on 'scroll', @onScroll

    onScroll: ->
      src = @$image.data 'pt-src'
      @$image.attr 'src', src

    onImageLoad: (event) ->
      rects = @$image[0].getBoundingClientRect()
      if rects.height > rects.width
        @$photo.addClass 'portrait'
      @$photo.addClass 'loaded'
