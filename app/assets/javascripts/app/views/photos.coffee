define ['marionette', 'views/photo', 'base'], (Marionette, PhotoView, Base) ->
  class PhotosPage extends Marionette.CollectionView
    id: 'photos'
    className: 'page'
    tagName: 'ul'
    itemView: PhotoView
    itemViewOptions: tagName: 'li'
    collection: new Base.Collection([], api: 'photos')

    # this stuff made the page feel unresponsive imo
    # will revisit later

    # delay: 0
    # delayDuration: 100
    # viewsRendered: 0

    # incrementDelay: ->
    #   delay = @delay
    #   @viewsRendered += 1
    #   @delay += @delayDuration
    #   @delay = 0 if (@collection.length - 1) * @delayDuration <= @delay
    #   return delay

    # renderItemView:(view, index) ->
    #   delay = @incrementDelay()
    #   _.delay =>
    #     super view, index
    #   , delay


