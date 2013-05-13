tests = Object.keys(window.__karma__.files).filter (file) ->
  return /base\/test\/(.*?)_spec/.test(file)

tests.push('expect')

require.config
  # path configuration
  baseUrl: '/base/app/'
  paths:
    'jquery': '../vendor/jquery/jquery'
    'underscore': '../vendor/underscore-amd/underscore'
    'marionette': '../vendor/marionette/lib/core/amd/backbone.marionette'
    'backbone': '../vendor/backbone-amd/backbone'
    'backbone.wreqr': '../vendor/backbone.wreqr/lib/amd/backbone.wreqr'
    'backbone.babysitter': '../vendor/backbone.babysitter/lib/amd/backbone.babysitter'
    'text': '../vendor/text/text'
    'expect': '../vendor/expect/expect'
    'dust': '../lib/dust'
    'dusty': '../lib/dusty'
    'dust.helpers': '../lib/dust.helpers'
    'json2': '../vendor/json2/json2'

  # shim for non AMD libraries
  shim:
    dust:
      exports: 'dust'
    chunk:
      exports: 'Chunk'

  # dust is retarded
  deps: tests

  callback: window.__karma__.start
