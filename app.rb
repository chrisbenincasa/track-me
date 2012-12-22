require 'sinatra/base'

class TrackMe < Sinatra::Base
  get '/' do
    if (@user = logged_in) != nil
      redirect '/dashboard'
    else
      haml :index, {:layout => :'layouts/layout'}
    end
  end
  
  run! if app_file == $0
end