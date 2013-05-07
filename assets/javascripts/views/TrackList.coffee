class views.TrackList extends views.MainView
  template: 'dashboard/track/listing'
  #tagName: 'ul'
  #id: 'track-list'
  initialize: ->
    @$el.on 'click', 'a.track-nav-item', @navTrack
  render: ->
    @$el.html JST[@template]()
    trackList = @$el.find 'ul.track-list'
    template = JST['dashboard/track/track_item']
    @options.tracks.each (model, index) =>
      rendered = template
        name: model.get 'name'
        id: model.id
        cid: model.cid
      trackList.append rendered
    @

  navTrack: (event) ->
    event.preventDefault()
    target = if event.target? $ event.target else $ event.currentTarget
    Backbone.history.navigate "dashboard/track/#{target.data 'id'}", trigger: true