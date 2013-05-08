define ['marionette', 'layout', 'router'], (Marionette, layout) ->
  Photeasy = new Marionette.Application()

  # configuration
  Marionette.Renderer.render = (template, data={}) ->
    return template && template.render(data)

  Photeasy.addInitializer (options) ->
    layout.render()
    Backbone.history.start pushState: true

    if Backbone.history and Backbone.history._hasPushState
      $(document).delegate 'a', 'click', (evt) ->
        href = $(@).attr 'href'
        protocol = @protocol + "//"
        if href.slice(protocol.length) != protocol
          evt.preventDefault()
          Backbone.history.navigate href, true

  return Photeasy
