define ['dust.helpers', 'utils/url'], (dust, url) ->
  helpers = dust.helpers
  chunk = new dust.Chunk()

  describe 'Dust helpers', ->

    beforeEach ->
      chunk = new dust.Chunk()

    describe 'url', ->

      it 'should return an app url in dust', ->
        helperUrl = helpers.url(chunk, {}, undefined, {key: 'photos'}).data
        expect(helperUrl).to.equal(url.urlTo('photos'))

    describe 'link', ->

      it 'should return a link with an app url', ->
        helperLink = helpers.link(chunk, {}, undefined, {key: 'photos'}).data
        expect(helperLink).to.equal(url.linkTo('photos')[0].outerHTML)

