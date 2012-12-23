class App.Router extends Backbone.Router
  routes:
    "dashboard/profile"   : 'profile'

  initialize: ->
    @dashboard = new views.Dashboard()

  profile: ->
    @dashboard.launch
      feature: views.Profile