define ['marionette', 'views/photo', 'collections/photos'], (Marionette, PhotoView, PhotosCollection) ->
  class PhotosPage extends Marionette.CollectionView
    id: 'photos'
    className: 'page'
    tagName: 'ul'
    itemView: PhotoView
    itemViewOptions: tagName: 'li'
    collection: new PhotosCollection()

    delay: 0
    delayDuration: 100
    viewsRendered: 0

    incrementDelay: ->
      delay = @delay
      @viewsRendered += 1
      @delay += @delayDuration
      @delay = 0 if (@collection.length - 1) * @delayDuration <= @delay
      return delay

    renderItemView:(view, index) ->
      delay = @incrementDelay()
      _.delay =>
        super view, index
      , delay


