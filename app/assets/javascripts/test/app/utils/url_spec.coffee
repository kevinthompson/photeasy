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

      it 'should return a app url with an id', ->
        expect(url.urlTo('photos', 1)).to.equal(url.urls.photos + '/1')

    describe 'linkTo', ->

      it 'should be a function', ->
        expect(url.linkTo).to.be.a('function')

      it 'should return a link', ->
        expect(url.linkTo('photos').is('a')).to.be.ok()

      it 'should accept an object', ->
        expect(url.linkTo(key: 'photos')).to.be.ok()

      it 'should accept params', ->
        expect(url.linkTo('photos')).to.be.ok()

      it 'should accept params and an options object', ->
        expect(url.linkTo('photo', 'Photos', {pushState: true}).data('push-state')).to.be.ok()

      it 'should return a link with an app url', ->
        expect(url.linkTo('photos').attr('href')).to.equal(url.urlTo('photos'))

      it 'should return a link with provided text', ->
        expect(url.linkTo('photos', 'Photos').text()).to.equal('Photos')

      it 'should return a link with an app url with an id', ->
        expect(url.linkTo('photos', 'Photos', {id: '1'}).attr('href')).to.equal(url.urlTo('photos', 1))

      it 'should return a link without a push state data attribute', ->
        expect(url.linkTo('photos', 'Photos').data('push-state')).to.not.be.ok()

      it 'should return a link with a push state data attribute', ->
        expect(url.linkTo('photos', 'Photos', {pushState: true}).data('push-state')).to.be.ok()
