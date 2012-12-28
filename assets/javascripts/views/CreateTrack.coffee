class views.CreateTrack extends views.MainView
  template: 'dashboard/track/create'
  events:
    'click button.create-button'  : 'create'
  initialize: ->
    console.log 'new CreateTrack View'
    @trackName = @$el.find 'input.name'
  render: ->
    @$el.html JST[@template]()
    @
  create: ->
    test = @$el.find 'input.name'
    console.log test.val(), @trackName.val()
    newModel = new model.Track 
      name: @trackName.val()
    console.log newModel