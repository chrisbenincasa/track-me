class views.Base extends Backbone.View  
  # _ensureElement: ->
  #   if not @el
  #     if _.isString @template
  #       @setElement JST[@template](@options), false
  #     else if _.isFunction @template
  #       @setElement @template(), false
  #     else 
  #       super
  #   else
  #     super