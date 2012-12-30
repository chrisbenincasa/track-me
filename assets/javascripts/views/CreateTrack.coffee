class views.CreateTrack extends views.MainView
  template: 'dashboard/track/create'
  events:
    'click button.create-button'  : 'create'
    
  initialize: ->
    @trackName = @$el.find 'input.name'
    @options.tracks.on 'request', @requestHandler

  render: ->
    @$el.html JST[@template]()
    @

  create: ->
    if @trackName.val()
      test = @options.tracks.create
        name: @trackName.val()
        units: 'feet'

  requestHandler: (model, xhr, options) ->
    if xhr.status == 200
      @options.tracks.fetch()