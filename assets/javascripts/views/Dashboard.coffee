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
    @$el.unbind()
    if opts and opts.feature
      feature = new opts.feature
      @$el.html(feature.render().$el)
    else
      @$el.html JST['dashboard']()