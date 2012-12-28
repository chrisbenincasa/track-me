class views.MainView extends views.Base
  constructor: (options = {}) ->
    @_configure options

    @renderTo = App.baseElement unless @renderTo?
    super

  show: (opts = {}) ->
    if currentView isnt @
      @$el.hide()

      renderTo = $ @renderTo
      @$el.appendTo renderTo

      if currentView?
        currentView.hide()
        @$el.fadeIn 'fast' if @$el.parent().is 'visible'
      @$el.show()
      currentView = @
    @

  hide: (opts = {}) ->
    if currentView is @
      currentView.$el.hide()
      if @options.cacheable is false
        currentView.$el.remove()
      else
        currentView.$el.detach()
      currentView = null

App.baseElement = 'div#dashboard > section.content'