class views.Profile extends views.MainView
  template: 'profile'
  render: ->
    @$el.html JST[@template]()
    @