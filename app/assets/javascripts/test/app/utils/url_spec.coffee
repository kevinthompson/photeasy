define ['utils/url'], (url) ->
  describe 'The url helper class', ->

    it 'should have a url property', ->
      expect(url.urls).to.be.an('object')

    describe 'apiTo', ->

      it 'should be a function', ->
        expect(url.apiTo).to.be.a('function')

      it 'should return an api url', ->
        expect(url.apiTo('photos')).to.equal(url.urls.api + url.urls.photos + '.json')

    describe 'urlTo', ->

      it 'should be a function', ->
        expect(url.urlTo).to.be.a('function')

      it 'should return a app url', ->
        expect(url.urlTo('root')).to.equal(url.urls.root)

    describe 'linkTo', ->

      it 'should be a function', ->
        expect(url.linkTo).to.be.a('function')

      it 'should return a link with an app url', ->
        expect(url.linkTo('photos').attr('href')).to.equal(url.urlTo('photos'))
