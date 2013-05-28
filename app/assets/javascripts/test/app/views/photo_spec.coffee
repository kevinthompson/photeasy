define ['views/photo', 'marionette', 'utils/vent'], (PhotoView, Marionette, vent) ->
  photoView = $photo = $el = click = dblClick = undefined

  describe 'Photo View', ->

    beforeEach ->
      photoView = new PhotoView()
      $el = photoView.render().$el
      click = -> $el.trigger('click')
      dblClick = ->
        click()
        setTimeout click, 100

    it 'should be an extension of a Marionette ItemView', ->
      expect(photoView).to.be.a(Marionette.ItemView)

    it 'should class the select photo method when clicked', (done) ->
      vent.on 'photo-selected', -> done()
      click()

    describe 'select photo', ->

      it 'it should fire the photo selected event on the event bus when not selected', (done) ->
        vent.on 'photo-selected', -> done()
        photoView.selectPhoto()

      it 'it should add the selected class when not selected', ->
      it 'it should fire the photo removed event on the event bus when selected', () ->
      it 'it should remove the selected class when selected', ->
