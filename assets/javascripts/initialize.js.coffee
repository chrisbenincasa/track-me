DashboardRouter = new App.Router
if not window.history.pushState
  Backbone.history.start()
else
  Backbone.history.start
    pushState: true

$(document).on 'click', 'a[href]:not([data-bypass])', (e) ->
  e.preventDefault()
  Backbone.history.navigate $(this).attr('href'), true