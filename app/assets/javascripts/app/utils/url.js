// Prototype
define(function(global) {
  var urls = {
    'absRoot': global.location.origin,
    'sign_in': '/users/sign_in',
    'sign_out': '/users/sign_out',
    'root': '/',
    'api': '/api/v1',
    'users': '/users',
    'photos': '/photos'
  };
  return {
    urlTo: function(key, id) {
      return urls[key] + (id ? '/' + id : '');
    },
    linkTo: function(key, text) {
      return $('<a/>').text(text || '').attr('href', this.urlTo(key));
    },
    apiTo: function(key, id) {
      return urls.api + this.urlTo(key, id) + '.json';
    }
  };
}(this));
