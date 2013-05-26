define ['marionette', 'controller'], (Marionette, controller) ->
  class Router extends Marionette.AppRouter
    controller: controller

    appRoutes:
      '(/)': 'showRoot'
      'photos(/)': 'showPhotos'
      '*path': 'show404'

  return new Router()
