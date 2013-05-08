define ['marionette', 'views/layout/header'], (Marionette, HeaderView) ->
  class Layout extends Marionette.Layout
    el: '#wrap'

    regions:
      header: '#header'
      main: '#main'
      footer: '#footer'

    onRender: ->
      @header.show new HeaderView()

  return new Layout()

