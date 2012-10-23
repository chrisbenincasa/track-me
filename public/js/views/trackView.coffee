defs = ['jquery', 'underscore', 'backbone', 'js/models/track']
define defs, ($, _, Backbone, TracksCollection) ->
  Tracks = new TracksCollection

  class TrackView extends Backbone.View
    initialize: ->
      Tracks.fetch()
      Tracks.on 'add', @modelAdd, @
      Tracks.on 'reset', @modelAll, @
      Tracks.on 'all', @render, @

    modelAdd: (track) ->
      console.log track, 'modelAdd'

    modelAll: ->
      console.log Tracks
      Tracks.each @modelAdd
      console.log @, 'modelAll'

    render: ->
      console.log @, 'render'