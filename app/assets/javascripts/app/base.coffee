define ['marionette', 'utils/url'], (Marionette, url) ->
  Base = {}

  class Base.ItemView extends Marionette.ItemView
  class Base.CollectionView extends Marionette.CollectionView

  class Base.Collection extends Backbone.Collection
    url: -> url.apiTo(@api) or undefined
    initialize: ->
      @fetch() if @url?
      super()
    parse: (response) ->
      if response.data?
        response = response.data
      return response

  class Base.Model extends Backbone.Model
    url: -> if url.apiTo(@api) then "#{url.apiTo(@api)}/#{@id}" else undefined
    initialize: ->
      @fetch() if @url?
      super()
    parse: (response) ->
      if response.data?
        response = response.data
      return response

  return Base

