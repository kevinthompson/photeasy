require.config

  baseUrl: '/assets/app'
  paths:
    'jquery': 'libs/jquery'
    'underscore': 'libs/underscore'
    'marionette': 'libs/marionette'
    'backbone': 'libs/backbone'
    'backbone.wreqr': 'libs/backbone.wreqr'
    'backbone.babysitter': 'libs/backbone.babysitter'
    'text': 'libs/text'
    'dust': 'libs/dust'
    'dusty': 'libs/dusty'
    'speck': 'libs/speck'
    'dust.helpers': 'libs/dust.helpers'

  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    dust:
      exports: 'dust'
  deps: ['dust', 'dust.helpers']

  # development
  urlArgs: 'cachebust=' + (new Date()).getTime()
  waitSeconds: '2'

# Initialize app
define ['photeasy', 'jquery'], (Photeasy, $) ->
  $ ->
    Photeasy.start()
