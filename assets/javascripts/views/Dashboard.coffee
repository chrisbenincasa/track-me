class views.Dashboard extends Backbone.View
  el: '#dashboard'
  events: 
    'click a.profile' : 'profileLink'
  initialize: ->
    console.log 'new dashboard'

  profileLink: (e) ->
    e.preventDefault()
    Backbone.history.navigate "dashboard/profile", trigger: true

  launch: (opts) ->
    feature = new opts.feature
    @$el.unbind()
    @$el.empty()
    @$el.html(feature.render())