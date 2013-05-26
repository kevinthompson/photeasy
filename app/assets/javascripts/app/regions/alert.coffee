define ['marionette'], (Marionette) ->
  class AlertRegion extends Marionette.Region
    el: '#alert'
    show: (view) ->
      @ensureEl()
      view.render()
      @$el.append(view.el)
      Marionette.triggerMethod.call(view, 'show')
      Marionette.triggerMethod.call(@, 'show', view)
