define ['backbone.wreqr'], (Wreqr) ->
  vent = new Wreqr.EventAggregator()
  # TODO: figure out what im doing wrong here
  vent.on 'all', (event) ->
    console.log event if window.logEventBus
  return vent
