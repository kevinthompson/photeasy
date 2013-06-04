# Prototype
define [], ->
  urls:
    'absRoot': window.location.origin
    'sign_in': '/users/sign_in'
    'sign_out': '/users/sign_out'
    'root': '/'
    'api': '/api/v1'
    'users': '/users'
    'photos': '/photos'
    'albums': '/albums'

  urlTo: (key, id) ->
    if @urls[key]
      return @urls[key] + (if id then "/#{id}" else '')
    else
      return undefined

  linkTo: (key, text, options) ->
    if typeof key == 'object'
      params = key
      id = params.id
      key = params.key
      text = params.text
      pushState = params.pushState

    if typeof options == 'object'
      id = options.id
      pushState = options.pushState

    $link = $('<a/>').text(text || '').attr('href', @urlTo(key, id))

    if pushState?
      $link.attr('data-push-state', 'true')

    return $link

  apiTo: (key, id) ->
    if @urlTo(key, id)
      return @urls.api + @urlTo(key, id) + '.json'
    else
      return undefined
