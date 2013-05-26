define ['photeasy'], (Photeasy) ->
  describe 'Photeasy', ->

    it 'should be an object', ->
      expect(Photeasy).to.be.an('object')

    it 'should have a start method', ->
      expect(Photeasy.start).to.be.a('function')

    it 'should start the app when the start method is called', (done) ->
      Photeasy.on 'start', ->
        done()
      Photeasy.start()
