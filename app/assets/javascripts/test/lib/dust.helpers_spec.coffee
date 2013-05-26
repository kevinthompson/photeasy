define ['dust', 'dust.helpers', 'utils/url', 'jquery'], (dust, helpers, url, $) ->
  chunk = new dust.Chunk()
  params = $helperLink = undefined

  describe 'Dust helpers', ->

    it 'should be an object', ->
      expect(helpers).to.be.a('object')

    it 'should have methods', ->
      expect(helpers).to.not.be.empty()

    describe 'url', ->

      it 'should return an app url in dust', ->
        helperUrl = helpers.url(chunk, {}, undefined, {key: 'photos'}).data
        expect(helperUrl).to.equal(url.urlTo('photos'))

    describe 'link', ->

      beforeEach ->
        params =
          key: 'photos'
          text: 'Photos'
        chunk = new dust.Chunk()
        $helperLink = $(helpers.link(chunk, {}, undefined, params).data)

      it 'should return a link', ->
        expect($helperLink.is('a')).to.be.ok()

      it 'should return a link with the right link', ->
        expect($helperLink.attr('href')).to.equal(url.urlTo('photos'))

      it 'should return a link with the right text', ->
        expect($helperLink.text()).to.equal(params.text)

      it 'should return a link without a push state data attribute', ->
        expect($helperLink.data('push-state')).to.not.be.ok()

      it 'should return a link with a push state data attribute', ->
        params.pushState = true
        chunk = new dust.Chunk()
        $helperLink = $(helpers.link(chunk, {}, undefined, params).data)
        expect($helperLink.data('push-state')).to.be.ok()
