define ['underscore', 'backbone'], (_, Backbone) ->
  class Track extends Backbone.Model
    defaults:
      date_created: Date.now()
      name: 'test'
      units: null

    idAttribute: 'tid'

  class Tracks extends Backbone.Collection
    model: Track
    url: '/users/current/tracks'
    count: ->
      @length