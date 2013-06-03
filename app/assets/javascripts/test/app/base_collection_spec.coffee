define ['base', 'utils/url'], (Base, url) ->

  describe 'Base Collection', ->
    collection = new Base.Collection()

    beforeEach ->
      collection = new Base.Collection()

    describe 'url', ->

      it 'should return an api url if api is set', ->
        collection.api = 'photos'
        expect(collection.url()).to.equal(url.apiTo('photos'))

      it 'should return undefined if not api is set', ->
        expect(collection.url()).to.be(undefined)
