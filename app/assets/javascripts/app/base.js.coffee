define ['marionette', 'utils/url'], (Marionette, url) ->
  Base = {}

  class Base.ItemView extends Marionette.ItemView
  class Base.CollectionView extends Marionette.CollectionView
  class Base.Collection extends Backbone.Collection
    url: ->
      return url.apiTo(@api) or undefined
    initialize: ->
      if @url?
        @fetch()
    parse: (response) ->
      if response.data
        response = _.find response.data, -> return true
      return response
  class Base.Model extends Backbone.Model
    url: ->
      return url.apiTo(@api) || undefined
    initialize: ->
      if @url?
        @fetch()
    parse: (response) ->
      if response.data
        response = _.find response.data, -> return true
      return response

  return Base

