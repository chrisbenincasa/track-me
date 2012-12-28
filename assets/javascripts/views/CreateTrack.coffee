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
    if @trackName.val()
      test = @options.tracks.create
        name: @trackName.val()
        units: 'feet'
      console.log test