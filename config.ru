require 'rubygems'
require 'bundler'

Bundler.require

require './lib/initializer'
require './lib/middleware'
require './app'
Mongoid.load!('config/mongoid.yml')

#run Sinatra::Application
run TrackMe