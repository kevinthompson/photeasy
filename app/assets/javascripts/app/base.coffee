define ['marionette', 'utils/url', 'cocktail', 'utils/mixins'], (Marionette, url, Cocktail) ->
  Base = {}

  class Base.ItemView extends Marionette.ItemView
  Cocktail.mixin Base.ItemView, 'eventBus', 'states'

  class Base.Region extends Marionette.Region
    onShow: -> @setState 'rendered'
  Cocktail.mixin Base.Region, 'eventBus', 'states'

  class Base.Collection extends Backbone.Collection
    url: -> url.apiTo(@api) or undefined
  Cocktail.mixin Base.Collection, 'parseApi', 'eventBus'

  class Base.Model extends Backbone.Model
    url: -> if url.apiTo(@api, @id) then "#{url.apiTo(@api, @id)}" else undefined

  Cocktail.mixin Base.Model, 'parseApi', 'eventBus'

  return Base

