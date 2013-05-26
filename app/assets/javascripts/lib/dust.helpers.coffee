define ['dust', 'underscore', 'utils/url'], (dust, _, url) ->
  dust.helpers = _.extend dust.helpers,

    url: (chunk, context, bodies, params) ->
      chunk.write(url.urlTo(params.key))

    link: (chunk, context, bodies, params) ->
      chunk.write(url.linkTo(params)[0].outerHTML)

  return dust.helpers
