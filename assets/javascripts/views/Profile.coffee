class views.Profile extends Backbone.View
  initialize: ->
    console.log 'init App.Profile'
  render: ->
    html = JST['profile']()
    @$el.html html
    @