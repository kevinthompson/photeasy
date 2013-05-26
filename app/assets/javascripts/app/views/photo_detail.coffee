define ['marionette', 'dusty!photo_detail'], (Marionette, template) ->
  class PhotoDetailView extends Marionette.ItemView
    className: 'photo-detail'
    tagName: 'section'
    template: template
