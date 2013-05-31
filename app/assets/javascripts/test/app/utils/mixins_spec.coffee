define ['cocktail', 'utils/mixins'], (Cocktail, mixins) ->
  describe 'Mixins', ->

    TestClass = testObject =

    it 'should mixin', (done) ->
      mixin = test: -> done()
      class TestClass
      Cocktail.mixin TestClass, mixin
      (new TestClass()).test()

    describe 'parseApi', ->

      describe 'parse', ->

        it 'should return the response data if present', ->
          response = data: [{test: 'success'}]
          expect(mixins.parseApi.parse(response)).to.equal(response.data)

        it 'should return the response if data not present', ->
          response = [{test: 'success'}]
          expect(mixins.parseApi.parse(response)).to.equal(response)

    describe 'busEvents', ->

      describe 'bindBusEvents', ->

        it 'should bind handler to a bus event', ->
          class TestClass
            busEvents: {'test': 'onTest'}
            onTest: (data) -> expect(data).to.be(true)
          Cocktail.mixin TestClass, 'eventBus'
          testObject = new TestClass()
          testObject.eventBus.trigger('test', true)

        it 'should bind handler to a bus event on a child class', ->
          class TestClass
            busEvents: {'test': 'onTest'}
            onTest: (data) -> expect(data).to.be(true)
          Cocktail.mixin TestClass, 'eventBus'
          class TestClass2 extends TestClass
          testObject = new TestClass2()
          testObject.eventBus.trigger('test', true)

    describe 'states', ->

      beforeEach ->
        class TestClass
          $el: $('<div/>')
        Cocktail.mixin TestClass, 'states'
        testObject = new TestClass()

      describe 'hasState', ->

        it 'should return true if object has the passed state', ->
          testObject.currentState = 'test'
          expect(testObject.hasState('test')).to.be(true)

        it 'should return false if object does not have the passed state', ->
          testObject.currentState = 'test1'
          expect(testObject.hasState('test2')).to.be(false)

      describe 'setState', ->
        it 'should set currentState to a state if empty', ->
          testObject.setState 'test'
          expect(testObject.currentState).to.be('test')

        it 'should add a state to currentState in a space separated list', ->
          testObject.currentState = 'test1'
          testObject.setState 'test2'
          expect(testObject.currentState).to.be('test1 test2')

        it 'should set mulitple states', ->
          testObject.currentState = 'test1'
          testObject.setState 'test1 test2'
          expect(testObject.currentState).to.be('test1 test2')

        it 'should add the state class to the element if one exists', ->
          testObject.setState 'test'
          expect(testObject.$el.hasClass('test')).to.be(true)

        it 'should add the state class with prefix', ->
          testObject.statePrefix = 'test-'
          testObject.setState '1 2'
          expect(testObject.$el.attr('class')).to.be('test-1 test-2')

      describe 'unsetState', ->

        it 'should remove a state from currentState in a space separated list', ->
          testObject.currentState = 'test1 test2'
          testObject.unsetState('test2')
          expect(testObject.currentState).to.be('test1')

        it 'should clear currentState if last state', ->
          testObject.currentState = 'test'
          testObject.unsetState('test')
          expect(testObject.currentState).to.be('')

        it 'should remove mulitple states', ->
          testObject.currentState = 'test1 test2 test3'
          testObject.unsetState('test2 test3')
          expect(testObject.currentState).to.be('test1')

        it 'should remove the state class from the element if one exists', ->
          testObject.unsetState 'test1 test2'
          expect(testObject.$el.hasClass('test2')).to.be(false)

        it 'should remove the state class with prefix', ->
          testObject.statePrefix = 'test-'
          testObject.setState '1 2'
          testObject.unsetState '1'
          expect(testObject.$el.hasClass('test-1')).to.be(false)

      describe 'toggleState', ->
        it 'should remove a state if it exists', ->
          testObject.currentState = 'test'
          testObject.toggleState('test')
          expect(testObject.hasState('test')).to.be(false)

        it 'should add a state if it does not exist', ->
          testObject.currentState = 'test1'
          testObject.toggleState('test2')
          expect(testObject.hasState('test2')).to.be(true)
