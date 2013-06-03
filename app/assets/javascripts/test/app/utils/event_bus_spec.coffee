define ['utils/event_bus'], (EventBus) ->

  describe 'Event Bus', ->
    it 'should have a debugging flag', ->
      EventBus.debug = true
      expect(EventBus.debugger('testing event bus debugger')).to.be(true)
      EventBus.debug = false
