define ['marionette'], (Marionette) ->
  SHOW = 'show'

  class OverlayRegion extends Marionette.Region
    el: '#overlay'

    initialize: (options) ->
      self = @
      $(@el).on 'click', (event) ->
        self.onClick() if event.target == @

    onShow: ->
      @$el.addClass(SHOW)

    onClose: ->
      @$el.removeClass(SHOW)

    onClick: ->
      @close()
