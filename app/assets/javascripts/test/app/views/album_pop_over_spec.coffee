define [
  'views/album_pop_over'
  'models/photo'
  'utils/event_bus'
  'utils/mixins'
], (
  AlbumPopOver
  PhotoModel
  EventBus
) ->

  describe 'AlbumPopOver class', ->

    album = photo =
    ADD_ALBUM = 'album:add'
    REMOVE_ALBUM = 'album:remove'
    UPDATE_ALBUM = 'album:update'

    beforeEach ->
      album = new AlbumPopOver()
      photo = model: new PhotoModel(id: 1)

    describe 'method photoAction', ->
      it 'should trigger the add or remove event on the collection', (done) ->
        EventBus.on UPDATE_ALBUM, -> done()
        album.photoAction photo, 'add'

      it 'should fire an event on the event bus', (done) ->
        EventBus.on ADD_ALBUM, -> done()
        album.photoAction photo, 'add'

      it 'should attach the photo to the event', (done) ->
        EventBus.on ADD_ALBUM, (data) ->
          expect(data.model.get 'id').to.equal photo.model.get 'id'
          done()
        album.photoAction photo, 'add'

    describe 'method addPhoto', ->
      it 'should fire the album add event', (done) ->
        EventBus.on ADD_ALBUM, -> done()
        album.addPhoto photo

    describe 'method removePhoto', ->
      it 'should fire the album remove event', (done) ->
        EventBus.on REMOVE_ALBUM, -> done()
        album.removePhoto photo
