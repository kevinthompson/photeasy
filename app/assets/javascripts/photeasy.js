/**
 * Photeasy
 */
require.config({
  urlArgs: 'bust=' + (new Date()).getTime(),
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
    // app
    view: 'views/base',
    model: 'models/base',
    collection: 'collections/base',

    // libs
    jquery: 'libs/jquery',
    underscore: 'libs/underscore',
    backbone: 'libs/backbone',
    text: 'libs/text',
    dust: 'libs/dust',
    dusty: 'libs/dusty',

    // utils
    eventbus: 'utils/eventbus'
  }
});

define([
  'backbone',
  'eventbus',
  'views/index'],

function(Backbone, Bus, Index){
  var Photeasy,
    $doc = $(document),
    TITLE_PREFIX = 'Photeasy | ';

  Photeasy = Backbone.Router.extend({
    routes: { '': 'index' },
    index: function() {
      var index = new Index();
      index.$el.append(index.render().$el);
    }
  });

  // event listeners
  Bus.on('document:title', function(title) {
    $doc.prop('title', TITLE_PREFIX + title);
  });

  new Photeasy();
  Backbone.history.start();
});
