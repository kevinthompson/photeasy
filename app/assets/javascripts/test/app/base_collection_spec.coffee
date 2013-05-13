define ['base', 'utils/url'], (Base, url) ->
  collection = new Base.Collection

  describe 'Base Collection', ->

    beforeEach -> collection = new Base.Collection

    it 'should be an extension of a Backbone.Collection', ->
      expect(collection).to.be.a(Backbone.Collection)

    describe 'url', ->

      it 'should be a function', ->
        expect(Base.Collection::url).to.be.a('function')

      it 'should return an api url', ->
        apiUrl = url.apiTo('photos')
        collection.api = 'photos'
        expect(collection.url()).to.equal(apiUrl)

    describe 'parse', ->

      it 'should return the response data if present', ->
        response = data: photos: [{test: 'success'}, {test: 'fail'}]
        expect(collection.parse(response)).to.equal(response.data.photos)

      it 'should return the response if data not present', ->
        response = [{test: 'success'}, {test: 'fail'}]
        expect(collection.parse(response)).to.equal(response)

