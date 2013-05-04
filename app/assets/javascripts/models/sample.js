define(['backbone'], function(Backbone) {
  return Backbone.Model.extend({
    defaults: {
      name: 'Dylan Hudson',
      age: 27,
      children: 2
    }
  });
});
