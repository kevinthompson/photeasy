define ['base', 'utils/url'], (Base, url) ->
  collection = new Base.Collection

  describe 'Base Collection', ->

    beforeEach ->
      collection = new Base.Collection()

    it 'should have mixins', ->

    it 'should be an extension of a Backbone.Collection', ->
      expect(collection).to.be.a(Backbone.Collection)

    describe 'url', ->

      it 'should return an api url if api is set', ->
        collection.api = 'photos'
        expect(collection.url()).to.equal(url.apiTo('photos'))

      it 'should return undefined if not api is set', ->
        expect(collection.url()).to.be(undefined)
