// Prototype
define([
  'dust',
  'underscore',
  'utils/urls'],

function(dust, _, Urls) {
  dust.helpers = _.extend(dust.helpers, {
    url: function(chunk, context, bodies, params) {
      return chunk.write(Urls.urlTo(params.key));
    },
    link: function(chunk, context, bodies, params) {
      return chunk.write(Urls.linkTo(params.key, params.text)[0].outerHTML);
    }
  });
});
