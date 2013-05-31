define ['marionette', 'layout', 'router', 'utils/mixins'], (Marionette, layout) ->
  Photeasy = new Marionette.Application()

  # CONFIGURATION

  # define the way Marionette renders templates
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
      $(document).delegate 'a', 'click', (event) ->
        # get the href of clicked link
        href = $(@).attr 'href'
        # check if link is external and don't have a push state false data attribute
        protocol = @protocol + "//"
        # unintellegently filtering certain paths
        if href.slice(protocol.length) != protocol and !$(@).data('push-state') and !href.match(/(sign_|auth|users)/)
          event.preventDefault()
          # set the url using push state which will trigger the router
          Backbone.history.navigate href, true

  # images = []
  # windowHeight = $(window).height()
  # lazyLoad = (image) ->
  #   if image
  #     if windowHeight and image[0].getBoundingClientRect().top < windowHeight
  #       src = image.data 'src'
  #       image.attr 'src', src
  #     else
  #       images.push(image)
  #   else
  #     _.each images, (image, index) ->
  #       if windowHeight and image[0].getBoundingClientRect().top < windowHeight
  #         delete images[index]
  #         src = image.data 'src'
  #         image.attr 'src', src
  #     images = _.compact images

  # $(window).on 'scroll', -> lazyLoad()
  # $(window).on 'resize', -> windowHeight = $(window).height()


  # return the app
  return Photeasy
