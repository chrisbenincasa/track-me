require 'date'
class TrackMe < Sinatra::Application
  before '/dashboard*' do
    if (@user = logged_in) == nil
      halt
    end
  end

  get '/dashboard' do
    haml :dashboard, :locals => {:user => @user}
  end

  get '/dashboard/profile' do
    haml :dashboard, :locals => {:user => @user}
  end

  get '/dashboard/tracks', :provides => 'json' do
    @user.tracks.to_json
  end

  post '/dashboard/tracks' do
    payload = JSON.parse request.body.read
    name = payload['name']
    date = payload['date_created']
    units = payload['units']
    newTrack = Track.new(
      :tid => (Track.count + 1),
      :name => name,
      :date_created => Time.at(date).to_datetime,
      :units => units
    )
    if newTrack.save
      redirect '/dashboard'
    else
      halt
    end
  end

  get '/dashboard/track/create' do
    haml :dashboard, :locals => {:user => @user}
  end
end