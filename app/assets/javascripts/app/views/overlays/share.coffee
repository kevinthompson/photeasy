define [
  'base'
  'dusty!overlays/share'
  'token.input'
], (
  Base
  template
) ->

  class ShareModal extends Base.ItemView
    template: template
    tagName: 'section'
    className: 'share-modal'
    model: new Base.Model({}, api: 'albums')

    initialize: ->
      @eventBus.trigger 'request:photos', @onPhotosReturned
      super

    onRender: ->
      @$('textarea').tokenField()

    events:
      'submit form': 'createShare'
      'click .pills': 'onPills'

    onPills: (event) ->
      event.preventDefault()

    createInput: -> $('<input type="email" novalidate/>')

    onPhotosReturned: (photos) =>
      @collection = photos

    createShare: (event) ->
      event.preventDefault()
      name = @$('input[type="text"]').val()
      $emails = @$('input[type="email"]')
      emails = []
      $emails.each ->
        val = $(@).val()
        if val
          emails.push email: val

      @model.set 'name', name
      @model.set 'share_attributes', emails
      @model.set 'photo_ids', _.values @collection.pluck 'id'
      @model.save()

