define ['backbone.wreqr'], (Wreqr) ->
  vent = new Wreqr.EventAggregator()
  # TODO: figure out what im doing wrong here
  vent.on 'thefuck', -> console.log 'thefuck'
  return vent
