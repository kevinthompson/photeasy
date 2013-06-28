define ['base', 'utils/url'], (Base, url) ->

  describe 'Base @model', ->

    beforeEach ->
      @model = new Base.model()

    describe 'url', ->

      it 'should return an api url if api is set', ->
        @model.api = 'photos'
        expect(@model.url()).to.equal(url.apiTo('photos'))

      it 'should return an api url with id if id is set', ->
        @model.api = 'photos'
        @model.id = 1
        expect(@model.url()).to.equal(url.apiTo('photos', 1))

      it 'should return undefined if not api is set', ->
        expect(@model.url()).to.be(undefined)

    describe 'form events', ->

      beforeEach ->
        @model = new Base.model
          formEvents:
            'data': 'input'

      it 'should update the model when an input on blur', ->
      it 'should update the model when the form is submitted', ->
