define(function(require) {
  var Backbone = require('backbone');
  return Backbone.Router.extend({
     routes: {
       '': 'index',
       'users/:id': 'users',
       'photos': 'photos'
     },
     index: function() {
       var IndexView = require('views/index');
       (new IndexView()).render();
     },
     users: function(id) {
       var UserView = require('views/index');
       (new UserView(id)).render();
     },
     photos: function(id) {
       var PhotoView = require('views/photos');
       (new PhotoView(id)).render();
     }
  });
});
