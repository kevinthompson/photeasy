require.config

  # path configuration
  baseUrl: '/assets/app'
  paths:
    'jquery': '../vendor/jquery/jquery'
    'underscore': '../vendor/underscore-amd/underscore'
    'marionette': '../vendor/marionette/lib/core/amd/backbone.marionette'
    'backbone': '../vendor/backbone-amd/backbone'
    'backbone.wreqr': '../vendor/backbone.wreqr/lib/amd/backbone.wreqr'
    'backbone.babysitter': '../vendor/backbone.babysitter/lib/amd/backbone.babysitter'
    'text': '../vendor/text/text'
    'dust': '../lib/dust'
    'dusty': '../lib/dusty'
    'dust.helpers': '../lib/dust.helpers'
    'json2': '../vendor/json2/json2'

  # shim for non AMD libraries
  shim:
    dust:
      exports: 'dust'

  # dust is retarded
  deps: ['dust', 'dust.helpers']

  # development
  urlArgs: 'cachebust=' + (new Date()).getTime()
  waitSeconds: '2'

# Initialize app
define ['photeasy', 'jquery'], (Photeasy, $) ->
  $ ->
    Photeasy.start()
