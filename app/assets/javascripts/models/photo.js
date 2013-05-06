define([
  'model'],

function(BaseModel) {
  return BaseModel.extend({
    url: function() {
      this.url.apiTo('photos', this.get('id'));
    },
    parse: function(response) {
      return (response.data || response);
    }
  });
});
