class App.Router extends Backbone.Router
  routes:
    "dashboard/"           : 'dashboard'
    "dashboard/profile/"   : 'profile'

  initialize: ->
    @dashboard = new views.Dashboard()

  dashboard: ->
    @dashboard.launch()

  profile: ->
    @dashboard.launch
      feature: views.Profile