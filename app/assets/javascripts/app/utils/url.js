// Prototype
define(function() {
  return {
    urls: {
      'absRoot': window.location.origin,
      'sign_in': '/users/sign_in',
      'sign_out': '/users/sign_out',
      'root': '/',
      'api': '/api/v1',
      'users': '/users',
      'photos': '/photos'
    },

    urlTo: function(key, id) {
      return this.urls[key] + (id ? '/' + id : '');
    },

    linkTo: function(key, text, pushState) {
      return $('<a/>').text(text || '').attr('href', this.urlTo(key));
    },

    apiTo: function(key, id) {
      return this.urls.api + this.urlTo(key, id) + '.json';
    }
  };
});
