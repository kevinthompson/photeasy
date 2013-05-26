define ['marionette', 'controller'], (Marionette, controller) ->
  class Router extends Marionette.AppRouter
    controller: controller

    appRoutes:
      '(/)': 'showRoot'
      'photos(/)': 'showPhotos'
      'sign_in(/)': 'ignoreRoute'
      'sign_out(/)': 'ignoreRoute'
      'users/*path': 'ignoreRoute'
      '*path': 'show404'

  return new Router()
