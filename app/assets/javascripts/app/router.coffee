define ['marionette', 'controller'], (Marionette, controller) ->
  class Router extends Marionette.AppRouter
    controller: controller

    appRoutes:
      '(photos)': 'showRoot'
      'sign_in': 'ignoreRoute'
      'sign_out': 'ignoreRoute'
      'users/*path': 'ignoreRoute'
      'auth/*path': 'ignoreRoute'
      '*path': 'show404'

    initialize: ->
      @on 'route:before', (route) =>
        if !window.current_user and route != 'sign_in' and window.location.pathName != '/sign_in'
          window.location = '/sign_in'
      super

    route: (route, name, handler) ->
      super route, name, ->
        @trigger 'route:before', route
        handler()
        @trigger 'route:after', route

  return new Router()
