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
    'dust': '../vendor/dustjs-linkedin/dist/dust-full-1.2.2'
    'dusty': '../lib/dusty'
    'dust.helpers': '../lib/dust.helpers'
    'json2': '../vendor/json2/json2'
    'cocktail': '../vendor/cocktail/Cocktail'

  # shim for non AMD libraries
  shim:
    dust:
      exports: 'dust'

    cocktail:
      exports: 'Cocktail'

  # dust is retarded
  deps: ['dust', 'dust.helpers', 'utils/mixins']

  # development
  urlArgs: 'cachebust=' + (new Date()).getTime()
  waitSeconds: '2'

# Initialize app
define ['photeasy', 'jquery'], (Photeasy, $) ->
  $ ->
    Photeasy.start()
