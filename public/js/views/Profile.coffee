defs = ['jquery', 'underscore', 'backbone']
define defs, ($, _, Backbone) ->
  class Profile extends Backbone.View
    initialize: ->
      console.log 'init App.Profile'
    render: ->
      console.log JST['edit']()