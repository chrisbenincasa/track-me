class App.Router extends Backbone.Router
  routes:
    "dashboard" : 'dashboard'
    "dashboard/profile" : 'profile'
    "dashboard/track/create" : 'createTrack'
    "dashboard/track/:id" : 'navToTrack'

  initialize: ->
    @dashboard = new views.Dashboard

  dashboard: ->
    @dashboard.launch
      feature: views.TrackList

  profile: ->
    @dashboard.launch
      feature: views.Profile

  createTrack: ->
    @dashboard.launch
      feature: views.CreateTrack

  navToTrack: (tid) ->
    @dashboard.launch
      feature: views.Track