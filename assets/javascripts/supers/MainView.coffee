class views.MainView extends views.Base
  constructor: (options = {}) ->
    @_configure options
    @renderDest = App.baseElement unless @renderDest?
    super

  show: (opts = {}) ->
    if currentView isnt @
      @$el.hide()
      renderDest = $ @renderDest
      @$el.appendTo renderDest
      if currentView?
        currentView.hide()
        @$el.fadeIn 'fast' if @$el.parent().is 'visible'
      @$el.show()
      currentView = @
    @

  hide: (opts = {}) ->
    if currentView is @
      currentView.$el.hide()
      currentView.$el.remove()
      currentView = null

App.baseElement = 'div#dashboard > section.content'