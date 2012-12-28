class views.Profile extends views.MainView
  #el: 'section.content'
  template: 'profile'
  initialize: ->
    console.log 'init views.Profile'
  render: ->
    @$el.html JST[@template]()
    @