define([
  'backbone',
  'utils/urls'],

function(Backbone, Urls) {
  return Backbone.Collection.extend({
    urls: Urls,
    parse: function(response, options) {
      return response.data.photos;
    }
  });
});

