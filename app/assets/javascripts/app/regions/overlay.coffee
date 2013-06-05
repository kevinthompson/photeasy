define ['base'], (Base) ->

  class Overlay extends Base.Region
    SHOW = 'show'
    ESC = 27

    el: '#overlay'

    events:
      'click': 'onClick'

    busEvents:
      'overlay:show': 'show'
      'overlay:close': 'close'

    initialize: ->
      @$el = $(@el).on('click', @onClick)
      $(window).on('keyup', @onKeyUp)
      super


    show: (overlay) ->
      if _.isString overlay
        require ["views/overlays/#{overlay}"], (Modal) =>
          super new Modal
      else
        super

    onClick: (event) =>
      if event.target == @$el[0]
        event.preventDefault()
        @close()

    onKeyUp: (event) =>
      if event.which == ESC
        event.preventDefault()
        @close()

    onShow: ->
      @setState SHOW
      $('body').css
        'overflow': 'hidden'
        'height': $(window).height()
      @$el.children().first().attr('tabindex', '0').focus()
      @eventBus.trigger 'overlay:shown'

    onClose: ->
      $('body').css
        'overflow': ''
        'height': ''
      @unsetState SHOW
      @eventBus.trigger 'overlay:closed'
