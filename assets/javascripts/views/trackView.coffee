TracksCollection = new model.Tracks
class views.TrackView extends Backbone.View
  el: '#dashboard'
  initialize: ->
    TracksCollection.fetch()
    TracksCollection.on 'add', @modelAdd, @
    TracksCollection.on 'reset', @modelAll, @
    TracksCollection.on 'all', @render, @

  modelAdd: (track) ->
    console.log track, 'modelAdd'

  modelAll: ->
    TracksCollection.each @modelAdd

  render: ->
    @$el.html 'hello!'