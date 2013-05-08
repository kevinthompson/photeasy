define ['marionette'], (Marionette) ->
  Marionette.Renderer.render = (template, data={}) ->
    return template && template.render(data)

  if Backbone.history and Backbone.history._hasPushState
    $(document).delegate'a', 'click', (evt) ->
      href = $(@).attr 'href'
      protocol = @protocol + "//"
      if href.slice(protocol.length) !== protocol
        evt.preventDefault()
        Backbone.history.navigate href, true

