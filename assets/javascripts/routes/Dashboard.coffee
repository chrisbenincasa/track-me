class App.Router extends Backbone.Router
  routes:
    "dashboard" : 'dashboard'
    "dashboard/profile" : 'profile'
    "dashboard/track/create" : 'createTrack'

  initialize: ->
    @dashboard = new views.Dashboard

  dashboard: ->
    @dashboard.launch()

  profile: ->
    @dashboard.launch
      feature: views.Profile

  createTrack: ->
    @dashboard.launch
      feature: views.CreateTrack