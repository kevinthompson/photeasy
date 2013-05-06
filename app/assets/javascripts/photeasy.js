/**
 * Photeasy
 */
require.config({
  urlArgs: 'cachebust=' + (new Date()).getTime(),
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
    eventbus: 'utils/eventbus',
    urls: 'utils/urls'
  },
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
  }
});

define([
  'backbone',
  'router',
  'views/layout',
  'libs/dust_helpers'],

function(Backbone, Router, LayoutView){
  var $doc = $(document);

  new LayoutView();
  new Router();
  Backbone.history.start({pushState: true});

  if (Backbone.history && Backbone.history._hasPushState) {
    // Use delegation to avoid initial DOM selection and allow all matching elements to bubble
    $doc.delegate('a', 'click', function(evt) {
      // Get the anchor href and protcol
      var href = $(this).attr('href');
      var protocol = this.protocol + '//';
      // Ensure the protocol is not part of URL, meaning its relative.
      // Stop the event bubbling to ensure the link will not cause a page refresh.
      if (href.slice(protocol.length) !== protocol) {
        evt.preventDefault();
        // Note by using Backbone.history.navigate, router events will not be
        // triggered.  If this is a problem, change this to navigate on your
        // router.
        Backbone.history.navigate(href, true);
      }
    });
  }
});
