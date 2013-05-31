define ['views/photo', 'marionette', 'models/photo', 'utils/event_bus', 'utils/mixins'], (PhotoView, Marionette, PhotoModel, EventBus, mixins) ->
  photoView =
  PREFIX = 'photo:'
  SELECTED = 'selected'
  SELECTED_EVENT = "#{PREFIX}state:set:selected"
  UNSELECT_EVENT = "#{PREFIX}state:unset:selected"

  describe 'PhotoView', ->

    beforeEach ->
      photoView = new PhotoView()
      photoView.model = new PhotoModel(id: 1)

    it 'should be an extension of a Marionette ItemView', ->
      expect(photoView).to.be.a(Marionette.ItemView)

    it 'should have mixins', ->
      methods = _.methods photoView
      mixinMethods = ['bindBusEvents']
      expect(_.intersection(methods, mixinMethods).length).to.be.equal(mixinMethods.length)

    describe 'selectPhoto method', ->

      it 'should fire the photo selected event on the event bus', (done) ->
        EventBus.on SELECTED_EVENT, -> done()
        photoView.setState 'selected'

      it 'should add the selected class', ->
        photoView.setState 'selected'
        expect(photoView.$el.hasClass SELECTED).to.be(true)

    describe 'unselectPhoto method', ->

      it 'should fire the photo unselected event on the event bus', (done) ->
        EventBus.on UNSELECT_EVENT, -> done()
        photoView.toggleState 'selected'
        photoView.toggleState 'selected'

      it 'should remove the selected class', ->
        photoView.toggleState 'selected'
        photoView.toggleState 'selected'
        expect(photoView.$el.hasClass SELECTED).to.be(false)

    describe 'onUnselect method', ->

      it 'should unselect the photo if the id matches', ->
        photoView.setState 'selected'
        photoView.onUnselect(1)
        expect(photoView.$el.hasClass SELECTED).to.be(false)

      it 'should unselect the photo if the id is "all"', ->
        photoView.setState 'selected'
        photoView.onUnselect('all')
        expect(photoView.$el.hasClass SELECTED).to.be(false)
