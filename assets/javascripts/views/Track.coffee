class views.Track extends views.Base
  template: 'dashboard/track/track_item'

  render: ->
    template = JST[@template]
      name: @model.get 'name'
      id: @model.get 'tid'
    @$el.html template
    @