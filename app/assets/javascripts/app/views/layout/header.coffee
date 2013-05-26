define ['marionette', 'dusty!layout/header'], (Marionette, template) ->
  $window = $(window)
  FADE = 'fade'
  FIXED = 'fixed'

  class HeaderView extends Marionette.ItemView
    template: template

    onRender: ->
      @$nav = @$('#nav')
      @$fixedNav = @$('.inner', @$nav)
      @$logoMark = @$('#logo-mark')
      @handleScroll()
      $window.on 'scroll', => @handleScroll()

    handleScroll: (event) ->
      rect = @$nav[0].getBoundingClientRect()
      if rect.top < 0
        @addFixed(rect)
      else
        @removeFixed()

    addFixed: (rect) ->
      fade = if rect.top < -rect.height then " #{FADE}" else ''
      @$nav.addClass("#{FIXED}#{fade}")
      @$logoMark.addClass(FIXED)

    removeFixed: ->
      @$nav.removeClass("#{FIXED} #{FADE}")
      @$logoMark.removeClass(FIXED)
