class views.Profile extends Backbone.View
  initialize: ->
    console.log 'init App.Profile'
  render: ->
    console.log JST['edit']()