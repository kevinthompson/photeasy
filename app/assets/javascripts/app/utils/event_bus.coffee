define ['backbone.wreqr'], (Wreqr) ->
  vent = new Wreqr.EventAggregator()

  vent.debugger = (event) ->
    if vent.debug then console.log event
    return vent.debug

  vent.on 'all', (event) => vent.debugger(event)

  return vent
