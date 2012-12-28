class model.Track extends Backbone.Model
  defaults:
    date_created: 0 + (new Date()) / 1000
    name: null
    units: null

  idAttribute: 'tid'

class model.Tracks extends Backbone.Collection
  model: model.Track
  url: '/dashboard/tracks'
  count: ->
    @length