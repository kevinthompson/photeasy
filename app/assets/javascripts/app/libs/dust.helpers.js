// Prototype
define([
  'dust',
  'underscore',
  'utils/url'],

function(dust, _, url) {
  dust.helpers = _.extend(dust.helpers, {
    url: function(chunk, context, bodies, params) {
      return chunk.write(url.urlTo(params.key));
    },
    link: function(chunk, context, bodies, params) {
      return chunk.write(url.linkTo(params.key, params.text)[0].outerHTML);
    }
  });
});
