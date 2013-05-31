define ['views/album_pop_over', 'models/photo', 'utils/event_bus', 'utils/mixins'], (AlbumPopOver, PhotoModel, EventBus) ->

  describe 'AlbumPopOver class', ->
    album = new AlbumPopOver()
    photo = new PhotoModel()
    ADD_PHOTO = 'share:add-photo'
    REMOVE_PHOTO = 'share:remove-photo'
    UPDATE_COUNT = 'share:update-count'

    beforeEach ->
      album = new AlbumPopOver()
      photo = model: new PhotoModel(id: 1)

    describe 'method updateCounter', ->
      it 'should emit an event', (done) ->
        EventBus.on UPDATE_COUNT, (data) ->
          expect(data).to.be(album.collection.length)
          done()
        album.updateCounter()

    describe 'method addPhoto', ->
      it 'should add a photo to the collection', ->
        album.addPhoto(photo)
        expect(album.collection.get(1).get('id')).to.be(photo.model.get('id'))

      it 'should fire an event on the event bus', (done) ->
        EventBus.on ADD_PHOTO, -> done()
        album.addPhoto(photo)

      it 'should update the counter', ->
        EventBus.on UPDATE_COUNT, (data) ->
          expect(data).to.equal(album.collection.length)
        album.addPhoto(photo)

      it 'should attach the model to the event', (done) ->
        EventBus.on ADD_PHOTO, (data) ->
          expect(data.model.get('id')).to.be(photo.model.get('id'))
          done()
        album.addPhoto(photo)

    describe 'method removePhoto', ->

      it 'should remove a photo to the collection', ->
        album.addPhoto(photo)
        album.removePhoto(photo)
        expect(album.collection.get(photo)).to.not.be.ok()

      it 'should fire an event on the event bus', (done) ->
        album.addPhoto(photo)
        EventBus.on REMOVE_PHOTO, -> done()
        album.removePhoto(photo)

      it 'should attach the model to the event', (done) ->
        album.addPhoto(photo)
        EventBus.on REMOVE_PHOTO, (data) ->
          expect(data.model.get('id')).to.be(photo.model.get('id'))
          done()
        album.removePhoto(photo)

      it 'should update the counter', ->
        album.addPhoto(photo)
        EventBus.on UPDATE_COUNT, (data) ->
          expect(data).to.equal(album.collection.length)
        album.removePhoto(photo)
