define(['backbone', 'utils/urls'], function(Backbone, Urls) {
  return Backbone.Model.extend({
    urls: Urls
  });
});
