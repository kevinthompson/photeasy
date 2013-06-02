#= require vendor/require.config

# this is to alias the paths provided by
# jam to something else
# NOTE: maybe this should be moved
modulePath = (name, alt) ->
  pkgs = jam.packages
  # searching jam's packages for a matching name
  for pkg in pkgs
    if pkg.name == name
      location = pkg.location + '/'
      # normalizing the string coming from jam
      # by removing any '^./' and '.js$'
      file = (alt or pkg.main).replace(/\.\/|\.js$/g, '')
      return location + file

  # returning the name if no package is found
  return name

# Overrides for jam and requirejs-rail
require.config
  baseUrl: 'assets/app'
  paths:
    'cocktail': '../lib/cocktail'
    'dusty': '../lib/dusty'
    'dust.helpers': '../lib/dust.helpers'
    'dust': modulePath('dustjs-linkedin', 'dist/dust-full-1.1.1')
    'marionette': modulePath('backbone.marionette')

  shim:
    dust: exports: 'dust'
    cocktail: exports: 'Cocktail'

  deps: ['dust', 'dust.helpers']

# Initialize app
define ['photeasy'], (Photeasy) -> Photeasy.start()
