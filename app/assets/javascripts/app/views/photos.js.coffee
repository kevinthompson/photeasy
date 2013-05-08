define ['marionette', 'views/photo', 'collections/photos'], (Marionette, PhotoView, PhotosCollection) ->
  class PhotosView extends Marionette.CollectionView
    tagName: 'ul'
    itemView: PhotoView
    collection: new PhotosCollection()
