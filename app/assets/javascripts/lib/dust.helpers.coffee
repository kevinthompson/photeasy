define ['dust', 'utils/url'], (dust, url) ->
  dust.helpers =

    url: (chunk, context, bodies, params) ->
      chunk.write(url.urlTo(params.key))

    link: (chunk, context, bodies, params) ->
      chunk.write(url.linkTo(params)[0].outerHTML)

  return dust.helpers
