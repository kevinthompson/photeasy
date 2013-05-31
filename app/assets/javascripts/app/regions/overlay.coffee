define ['base'], (Base) ->
  SHOW = 'show'

  class OverlayRegion extends Base.Region
    el: '#overlay'

    events:
      'click': 'onClick'

    busEvents:
      'overlay:photo-detail': 'showPhotoDetail'

    # event handlers
    onClick: (event) ->
      @close() if event.target == @$el[0]

    # bus event handlers
    showPhotoDetail: ->

    # marionette events
    onShow: ->
      @$el.addClass(SHOW)

    onClose: ->
      @$el.removeClass(SHOW)
