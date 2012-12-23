defs = ['jquery', 'underscore', 'backbone', 'json', 'js/routes/Dashboard']
define defs, ($, _, Backbone, JSON, Router) ->
  class AppView extends Backbone.View
    el: 'body'
    events: 
      'click a.profile' : 'profileLink'
    initialize: ->
      Router = new Router()
      if not window.history.pushState
        Backbone.history.start
      else
        Backbone.history.start
          pushState: true

    profileLink: (e) ->
      e.preventDefault()
      Backbone.history.navigate "dashboard/profile", trigger: true