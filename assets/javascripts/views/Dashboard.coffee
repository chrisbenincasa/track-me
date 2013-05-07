currentView = null
class views.Dashboard extends views.Base
  el: 'div#dashboard section.content'
  initialize: ->
    @tracks = new model.Tracks (window.App.tracks)
    #@tracks.fetch()

  launch: (opts) ->
    @$el.empty()
    @$el.unbind()
    if opts and opts.feature
      feature = new opts.feature
        tracks: @tracks
      feature.show()
    else
      @$el.html JST['dashboard']()