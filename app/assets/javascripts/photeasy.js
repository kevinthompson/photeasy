/**
 * Photeasy
 */
require.config({
  shim: {
    underscore: {
      exports: '_'
    },
    backbone: {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    dust: {
      exports: 'dust'
    }
  },
  paths: {
    jquery: 'lib/jquery',
    underscore: 'lib/underscore',
    backbone: 'lib/backbone',
    dust: 'lib/dust',
    speck: 'lib/speck',
    text: 'lib/text'
  }
});

define(function(require){
  var Backbone = require('backbone'),

  Photeasy = Backbone.Router.extend({
    routes: {
      '': 'index'
    },
    index: function() {
      var Index = require('views/index'),
          index = new Index();
      return this;
    }
  });

  new Photeasy();
  Backbone.history.start();
});
