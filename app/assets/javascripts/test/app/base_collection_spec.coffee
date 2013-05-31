define ['base', 'utils/url'], (Base, url) ->
  collection = new Base.Collection

  describe 'Base Collection', ->

    beforeEach ->
      collection = new Base.Collection()

    it 'should have mixins', ->

    it 'should be an extension of a Backbone.Collection', ->
      expect(collection).to.be.a(Backbone.Collection)

    describe 'url', ->

      it 'should be a function', ->
        expect(collection.url).to.be.a('function')

      it 'should return an api url', ->
        collection.api = 'photos'
        expect(collection.url()).to.equal(url.apiTo('photos'))
