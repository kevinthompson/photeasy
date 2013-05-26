define ['marionette', 'dusty!photo', 'utils/vent'], (Marionette, template, vent) ->

  images = []
  windowHeight = $(window).height()
  lazyLoad = (image) ->
    if image
      if windowHeight and image[0].getBoundingClientRect().top < windowHeight
        src = image.data 'src'
        image.attr 'src', src
      else
        images.push(image)
    else
      _.each images, (image, index) ->
        if windowHeight and image[0].getBoundingClientRect().top < windowHeight
          delete images[index]
          src = image.data 'src'
          image.attr 'src', src
      images = _.compact images

  $(window).on 'scroll', -> lazyLoad()
  $(window).on 'resize', -> windowHeight = $(window).height()

  class PhotoView extends Marionette.ItemView
    tagName: 'li'
    template: template

    onRender: ->
      @$image = @$('img')
      @$photo = @$('.photo')
      lazyLoad(@$image)

      @$image.on 'load', => @onImageLoad()
      src = @$image.data 'pt-src'
      @$image.attr 'src', src

      @$el.on 'click', =>
        @showItemDetail()

    onImageLoad: (event) ->
      rects = @$image[0].getBoundingClientRect()
      if rects.height > rects.width
        @$photo.addClass 'portrait'
      @$photo.addClass 'loaded'

    showItemDetail: ->
      vent.trigger('photo-detail', @model)
