define ['marionette', 'views/photo', 'collections/photos'], (Marionette, PhotoView, PhotosCollection) ->
  class PhotosView extends Marionette.CollectionView
    tagName: 'ul'
    itemView: PhotoView
    collection: new PhotosCollection()

    delay: 0
    delayDuration: 250
    viewsRendered: 0

    incrementDelay: ->
      @viewsRendered += 1
      @delay += @delayDuration
      if (@collection.length - 1) * @delayDuration >= @delay
        @delay = 0

    renderItemView:(view, index) ->
      delay = @delay
      _.delay =>
        console.log delay
        super view, index
      , delay

      @incrementDelay()

