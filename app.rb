require 'sinatra'
require 'mongoid'
require 'json'
require 'haml'
require 'date'
require './lib/middleware'
Mongoid.load!('config/mongoid.yml')
require './lib/initializer'
require 'active_support/json'

use Rack::Logger
enable :sessions
set :session_secret, 'quantifyMeSecret'

class Track
  include Mongoid::Document
  field :tid, type: Integer
  field :date_created, type: DateTime
  field :name, type: String
  field :units, type: String
  belongs_to :user
  embeds_many :measurements
end

class Measurement
  include Mongoid::Document
  field :mid, type: Integer
  field :date_created, type: DateTime
  field :info, type: Float
  embedded_in :track
end

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

get '/' do
  if (@user = logged_in) != nil
    @track = Track.new(
      :tid => Track.count + 1,
      :date_created => DateTime.now,
      :info => 1.2030
    )
    redirect '/dashboard'
  else
    haml :index, {:layout => :'layouts/layout'}
  end
end

get '/dashboard' do
  haml :dashboard
end