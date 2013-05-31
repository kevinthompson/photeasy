define [
  'views/photo'
  'models/photo'
  'marionette'
  'utils/event_bus'
  'utils/mixins'
], (
  PhotoView
  PhotoModel
  Marionette
  EventBus
  mixins
) ->

  photoView = {}

  # constants
  PREFIX = 'photo'
  SELECTED = 'selected'
  SELECTED_EVENT = "#{PREFIX}:state:set:#{SELECTED}"
  UNSELECT_EVENT = "#{PREFIX}:state:unset:#{SELECTED}"

  describe 'PhotoView', ->

    beforeEach ->
      photoView = new PhotoView()

    it 'should be an extension of a Marionette ItemView', ->
      expect(photoView).to.be.a(Marionette.ItemView)

    it 'should have mixins', ->
      methods = _.methods photoView
      mixinMethods = ['bindBusEvents']
      expect(
        _.intersection(methods, mixinMethods).length
      ).to.be.equal(mixinMethods.length)

    describe 'onUnselect method', ->

      beforeEach ->
        photoView.model = new PhotoModel(id: 1)
        photoView.setState SELECTED

      it 'should unselect the photo if the id matches', ->
        photoView.onUnselect(1)
        expect(photoView.$el.hasClass SELECTED).to.be(false)

      it 'should unselect the photo if the id is "all"', ->
        photoView.onUnselect('all')
        expect(photoView.$el.hasClass SELECTED).to.be(false)
