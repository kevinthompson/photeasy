define [
  'regions/overlay'
  'base'
  'utils/event_bus'
], (
  Overlay
  Base
  EventBus
) ->

  describe 'Overlay', ->
    SHOW = 'show'
    ESC = 27
    CLICK = 'click'

    beforeEach ->
      @overlay = new Overlay el: $('<div/>')
      @view = new Base.ItemView el: $('<div/>')
      @overlay.show(@view)

    it 'should set the show state when the region is opened', ->
      expect(@overlay.hasState(SHOW)).to.be(true)

    it 'should unset the show state when the region is closed', ->
      @overlay.close()
      expect(@overlay.hasState(SHOW)).to.be(false)

    it 'should unset the show state when it is clicked', ->
      @overlay.$el.trigger CLICK
      expect(@overlay.hasState(SHOW)).to.be(false)

    it 'should not unset the show state when its child elements are clicked', ->
      @view.$el.trigger CLICK
      expect(@overlay.hasState(SHOW)).to.be(true)

    it 'should show a child view on the bus event overlay:open', ->
      @overlay.reset()
      EventBus.trigger 'overlay:show', @view
      expect(@overlay.currentView).to.be(@view)

    it 'should hide a child view on the bus event overlay:close', ->
      EventBus.trigger 'overlay:close'
      expect(@overlay.currentView).to.not.be.ok()

    it 'should unset the show state when <Esc> is pressed', ->
      keyup = $.Event 'keyup'
      keyup.which = ESC
      $(window).trigger keyup
      expect(@overlay.hasState(SHOW)).to.be(false)

