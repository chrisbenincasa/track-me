class model.Track extends Backbone.Model
  defaults:
    date_created: Date.now()
    name: 'test'
    units: null

  idAttribute: 'tid'

class model.Tracks extends Backbone.Collection
  model: model.Track
  url: '/users/current/tracks'
  count: ->
    @length