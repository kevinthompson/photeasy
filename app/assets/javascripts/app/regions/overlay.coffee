define ['marionette'], (Marionette) ->
  SHOW = 'show'

  class OverlayRegion extends Marionette.Region
    el: '#overlay'

    initialize: (options) ->
      $(@el).on 'click', => @onClick()

    onShow: ->
      @$el.addClass(SHOW)

    onClose: ->
      console.log 'on close'
      @$el.removeClass(SHOW)

    onClick: ->
      console.log 'on click'
      @close()
