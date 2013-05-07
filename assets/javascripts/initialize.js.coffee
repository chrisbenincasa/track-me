$(document).ready ->
  DashboardRouter = new App.Router
  if not window.history.pushState
    Backbone.history.start()
  else
    Backbone.history.start
      pushState: true

$(document).on 'click', 'a[href]:not([data-bypass])', (e) ->
  base = "#{location.protocol}//#{location.host}/"
  ele = $ @
  href = 
    prop: ele.prop("href")
    attr: ele.attr("href")
    relative: ele.attr("href").slice base.length, ele.attr("href").length
  root = "#{location.protocol}//#{location.host}/"
  if href.prop.slice(0, root.length) is root
    e.preventDefault()
    if ele.data 'relative'
      Backbone.history.navigate href.attr, true
    else 
      Backbone.history.navigate href.relative, true