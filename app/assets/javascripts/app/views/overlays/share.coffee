define [
  'base'
  '../../../lib/backbone-forms'
  'dusty!overlays/share'
], (
  Base
  Forms
  template
) ->

  class ShareModal extends Base.ItemView

    allTheEmails = ($el) ->
      $el.on 'keyup', =>
        if $el.val()
          $clone = $el.clone().val('')
          $el.after $clone
          $el.off 'keyup'
          allTheEmails($clone)

    template: template
    tagName: 'section'
    className: 'share-modal'
    model: new Base.Model({}, api: 'shares')

    initialize: ->
      @eventBus.trigger 'request:photos', @onPhotosReturned
      super

    events:
      'submit form': 'createShare'

    onRender: ->
      allTheEmails(@$('input[type="email"]:last'))

    onPhotosReturned: (photos) =>
      @collection = photos

    createShare: (event) ->
      event.preventDefault()
      title = @$('input[type="text"]').val()
      $emails = @$('input[type="email"]')
      emails = []
      $emails.each ->
        val = $(@).val()
        if val
          emails.push email: val

      @model.set 'title', title
      @model.set 'share_attributes', emails
      @model.set 'photo_ids', _.values @collection.pluck 'id'

      console.log @model.url()

      @model.save()

