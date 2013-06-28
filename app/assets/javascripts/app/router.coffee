define ['marionette', 'controller'], (Marionette, controller) ->
  class Router extends Marionette.AppRouter
    controller: controller

    appRoutes:
      '(photos)': 'showRoot'
      'sign_in': 'ignoreRoute'
      'sign_out': 'ignoreRoute'
      'users/*path': 'ignoreRoute'
      'auth/*path': 'ignoreRoute'
      'test': 'test'
      '*path': 'show404'

    initialize: ->
      super

    route: (route, name, handler) ->
      super route, name, ->
        @trigger 'route:before', route
        handler()
        @trigger 'route:after', route

  return new Router()
