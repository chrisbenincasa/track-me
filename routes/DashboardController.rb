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

  post 'dashboard/tracks' do
    
  end

  get '/dashboard/track/create' do
    haml :dashboard, :locals => {:user => @user}
  end

  post '/users/current/tracks' do
    
  end
end