deps = Object.keys(window.__karma__.files).filter (file) ->
  return /base\/test\/(.*?)_spec/.test(file)

deps.push 'dust'
deps.push 'dust.helpers'
deps.push 'expect'

require.config
  baseUrl: '/base/app/'
  packages: [
    name: "backbone"
    location: "../vendor/backbone"
    main: "backbone.js"
  ,
    name: "backbone.babysitter"
    location: "../vendor/backbone.babysitter"
    main: "lib/amd/backbone.babysitter.js"
  ,
    name: "marionette"
    location: "../vendor/backbone.marionette"
    main: "lib/core/amd/backbone.marionette.js"
  ,
    name: "backbone.wreqr"
    location: "../vendor/backbone.wreqr"
    main: "lib/amd/backbone.wreqr.js"
  ,
    name: "dust"
    location: "../vendor/dustjs-linkedin"
    main: "./dist/dust-full-1.1.1"
  ,
    name: "jquery"
    location: "../vendor/jquery"
    main: "dist/jquery.js"
  ,
    name: "json"
    location: "../vendor/json"
    main: "json.js"
  ,
    name: "text"
    location: "../vendor/text"
    main: "text.js"
  ,
    name: "underscore"
    location: "../vendor/underscore"
    main: "underscore.js"
  ]

  shim:
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

    dust: exports: 'dust'
    cocktail: exports: 'Cocktail'

    underscore:
      exports: "_"

  paths:
    'expect': '../lib/expect'
    'cocktail': '../lib/cocktail'
    'dusty': '../lib/dusty'
    'dust.helpers': '../lib/dust.helpers'

  deps: deps

  callback: window.__karma__.start
