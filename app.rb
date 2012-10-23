require 'sinatra'

use Rack::Logger
enable :sessions
set :session_secret, 'quantifyMeSecret'
set :raise_errors, true

helpers do
  def logged_in
    if session[:user]
      return User.where(email: session[:user].email).first
    else
      return nil
    end
  end
  def logger
    request.logger
  end
end

before '*' do 
  logger.info session[:user].inspect
end

before '/dashboard' do
  if logged_in == nil
    halt
  end
end

before '/dashboard/*' do
  if logged_in == nil
    halt
  end
end

get '/insert_data' do
  if (@user = logged_in) != nil
    # create 2 tracks
    #@track1 = Track.new(
    #  :tid => 
    #) 
  else
    halt
  end
end

get '/' do
  if (@user = logged_in) != nil
    redirect '/dashboard'
  else
    haml :index, {:layout => :'layouts/layout'}
  end
end

get '/dashboard' do
  haml :dashboard
end