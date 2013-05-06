define([
  'collection',
  'models/photo'],

function(BaseCollection, PhotoModel) {
  return BaseCollection.extend({
    url: function() {
      return this.urls.apiTo('photos');
    },
    model: PhotoModel
  });
});
