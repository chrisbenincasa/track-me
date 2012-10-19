defs = ['jquery', 'underscore', 'backbone', 'json', 'js/views/trackView']
define defs, ($, _, Backbone, JSON, TrackView) ->
  class AppView extends Backbone.View
    initialize: ->
      test = new TrackView
    