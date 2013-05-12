define ['marionette', 'layout', 'router'], (Marionette, layout) ->
  Photeasy = new Marionette.Application()

  # CONFIGURATION

  # define they way Marionette renders templates
  Marionette.Renderer.render = (template, data={}) ->
    return template && template.render(data)

  # on app start
  Photeasy.addInitializer (options) ->
    # start the app layout
    layout.render()
    # start the history manager
    Backbone.history.start pushState: true

    # handle internal links
    # check if push state is enabled
    if Backbone.history and Backbone.history._hasPushState
      # delegate anchor clicks
      $(document).delegate 'a', 'click', (evt) ->
        # get the href of clicked link
        href = $(@).attr 'href'
        # check if link is external and don't have a push state false data attribute
        protocol = @protocol + "//"
        if href.slice(protocol.length) != protocol and !$(@).data('pushstate')
          evt.preventDefault()
          # set the url using push state which will trigger the router
          Backbone.history.navigate href, true

  # return the app
  return Photeasy
