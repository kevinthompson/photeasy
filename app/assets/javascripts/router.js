define(function(require) {
  var Backbone = require('backbone');
  return Backbone.Router.extend({
     routes: {
       '': 'index',
       'users/:id': 'users'
     },
     index: function() {
       var IndexView = require('views/index');
       (new IndexView()).render();
     },
     users: function(id) {
       var UserView = require('views/index');
       (new UserView(id)).render();
     }
  });
});
