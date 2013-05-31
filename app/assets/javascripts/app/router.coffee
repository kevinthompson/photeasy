define ['marionette', 'controller'], (Marionette, controller) ->
  class Router extends Marionette.AppRouter
    controller: controller

    appRoutes:
      '(photos)': 'showRoot'
      # 'albums/:id': 'showAlbum'
      'shares/:id': 'showShare'
      # 'prints/:id': 'showPrint'
      # 'orders/:id': 'showOrders'
      'sign_in': 'ignoreRoute'
      'sign_out': 'ignoreRoute'
      'users/*path': 'ignoreRoute'
      'auth/*path': 'ignoreRoute'
      '*path': 'show404'

  return new Router()
