DashboardRouter = new App.Router
if not window.history.pushState
  Backbone.history.start()
else
  Backbone.history.start
    pushState: true

$(document).on 'click', 'a[href]:not([data-bypass])', (e) ->
  base = "#{location.protocol}//#{location.host}/"
  href = 
    prop: $(this).prop("href")
    attr: $(this).attr("href")
    relative: $(this).attr("href").slice(base.length, $(this).attr("href").length)
  root = "#{location.protocol}//#{location.host}/"
  if href.prop.slice(0, root.length) is root
    e.preventDefault()
    Backbone.history.navigate href.relative, true