define([
  'views/parent',
  'views/photo',
  'collections/photos'],

function(ParentView, PhotoView, PhotosCollection) {
  return ParentView.extend({
    el: '#main',
    collection: new PhotosCollection(),

    initialize: function() {
      this.collection.fetch({
        success: _.bind(this.afterFetch, this)
      });
    },

    afterFetch: function() {
      _.each(this.collection.models, _.bind(function(model) {
        var photoView = new PhotoView();
        photoView.model = model;
        photoView.render().$el.appendTo(this.$el);
      }, this));
    }
  });
});
