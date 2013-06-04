define [
  'marionette'
  'cocktail'
  'utils/url'
  'utils/mixins'
], (
  Marionette
  Cocktail
  url
) ->

  Base = {}

  class Base.ItemView extends Marionette.ItemView
  Cocktail.mixin Base.ItemView, 'eventBus', 'states'

  class Base.Region extends Marionette.Region
    onShow: -> @setState 'rendered'
  Cocktail.mixin Base.Region, 'eventBus', 'states'

  class Base.Collection extends Backbone.Collection
    initialize: (models, options) ->
      @api = options?.api or ''
      super
    url: ->
      url.apiTo(@api)
    save: ->
      console.log @collection.attributes
      response = []
      _.each @models, (model) ->
        response.push model.attributes
      collection = new Backbone.Model(data: response)
      @sync 'create', collection, url: @url()

  Cocktail.mixin Base.Collection, 'parseApi', 'eventBus'

  class Base.Model extends Backbone.Model
    initialize: (attributes, options) ->
      @api = options?.api or ''
      super
    constructor: (@api) -> super
    url: -> if url.apiTo(@api, @id) then "#{url.apiTo(@api, @id)}" else undefined


  Cocktail.mixin Base.Model, 'parseApi', 'eventBus'

  return Base

