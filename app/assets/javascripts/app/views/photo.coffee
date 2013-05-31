define ['base', 'dusty!photo'], (Base, template) ->
  class PhotoView extends Base.ItemView
    # configuration
    template: template
    className: 'photo'

    # events
    events:
      'click': 'onClick'

    busEvents:
      'photo:all:state:unset:selected': 'onUnselect'

    eventPrefix: 'photo'

    # event handlers
    onClick: ->
      @toggleState 'selected'

    onImageLoad: ->
      _.delay => @setState 'loaded', 1

    # bus event handlers
    onUnselect: (id) ->
      if id == @model?.get('id') or id == 'all'
        @unsetState 'selected'

    # marionette event handlers
    onRender: ->
      @$image = @$('img')
      # backbone can't handle the load event
      @$image.on 'load', => @onImageLoad()
      @$image.attr 'src', @$image.data 'src'
