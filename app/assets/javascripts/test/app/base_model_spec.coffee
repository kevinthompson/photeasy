define ['base', 'utils/url'], (Base, url) ->

  describe 'Base Model', ->
    model = new Base.Model()

    beforeEach ->
      model = new Base.Model()

    describe 'url', ->

      it 'should return an api url if api is set', ->
        model.api = 'photos'
        expect(model.url()).to.equal(url.apiTo('photos'))

      it 'should return an api url with id if id is set', ->
        model.api = 'photos'
        model.id = 1
        expect(model.url()).to.equal(url.apiTo('photos', 1))

      it 'should return undefined if not api is set', ->
        expect(model.url()).to.be(undefined)
