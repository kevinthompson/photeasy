define ['cocktail', 'backbone', 'utils/event_bus'], (Cocktail, Backbone, EventBus) ->
  Cocktail.mixins.parseApi =
    parse: (response) -> response.data or response

  Cocktail.mixins.eventBus =
    eventBus: EventBus

    initialize: ->
      @bindBusEvents()
      return undefined

    bindBusEvents: ->
      if @busEvents?
        _.each @busEvents, (handler, event) =>
          @eventBus.on event, _.bind @[handler], @

  Cocktail.mixins.states =
    hasState: (state) -> !!(@currentState?.match(state))

    setState: (state) ->
      if !@hasState(state)
        currentSplit = @currentState?.split(' ') or []
        prefix = @statePrefix or ''
        stateSplit = state.split(' ')

        if @currentState
          @currentState = _.union(currentSplit, stateSplit).join(' ')
        else
          @currentState = state
        @$el.addClass prefix + stateSplit.join(' ' + prefix) if @$el

        if @trigger
          _.each stateSplit, (state) =>
            @trigger 'state:set', state
            if @eventBus and @eventPrefix
              @eventBus.trigger "#{@eventPrefix}:state:set:#{state}", @

      return @

    unsetState: (state) ->
      if @hasState(state)
        currentSplit = @currentState?.split(' ') or []
        stateSplit = state.split(' ')
        prefix = @statePrefix or ''

        @currentState = _.difference(currentSplit, stateSplit).join(' ')
        @$el.removeClass prefix + stateSplit.join(' ' + prefix) if @$el

        if @trigger
          _.each stateSplit, (state) =>
            @trigger 'state:unset', state
            if @eventBus and @eventPrefix
              @eventBus.trigger "#{@eventPrefix}:state:unset:#{state}", @

      return @

    toggleState: (state) ->
      if @hasState(state) then @unsetState(state) else @setState(state)
      return @

  return Cocktail.mixins
