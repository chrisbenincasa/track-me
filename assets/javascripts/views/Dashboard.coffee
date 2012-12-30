currentView = null
class views.Dashboard extends views.Base
  el: 'div#dashboard section.content'
  initialize: ->
    @tracks = new model.Tracks
    @tracks.on 'reset', @test, @
    @tracks.fetch()
    #  update: true

  launch: (opts) ->
    @$el.empty()
    @$el.unbind()
    if opts and opts.feature
      feature = new opts.feature
        tracks: @tracks
      feature.show()
    else
      @$el.html JST['dashboard']()

  test: (collection) ->
    collection.each (model, index) =>
      @addTrackView model, index

  addTrackView: (model, index) ->
    view = new views.Track
      model: model
    $('ul.track-list').append view.render().el