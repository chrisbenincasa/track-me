defs = ['js/views/Dashboard', 'js/views']
define defs, (Dashboard, views) ->
  class Router extends Backbone.Router
    routes:
      "dashboard/profile"     : 'profile'
      "dashboard/users/:id" : "profile"

    initialize: ->
      @dashboard = new Dashboard()

    profile: ->
      @dashboard.launch
        feature: views.Profile