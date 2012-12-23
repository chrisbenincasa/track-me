defs = ['jquery', 'underscore', 'backbone', 'js/models/track']
define defs, ($, _, Backbone, TracksCollection) ->
  Tracks = new TracksCollection

  class TrackView extends Backbone.View
    el: '#dashboard'
    initialize: ->
      Tracks.fetch()
      Tracks.on 'add', @modelAdd, @
      Tracks.on 'reset', @modelAll, @
      Tracks.on 'all', @render, @

    modelAdd: (track) ->
      console.log track, 'modelAdd'

    modelAll: ->
      Tracks.each @modelAdd

    render: ->
      @$el.html 'hello!'