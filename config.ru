require 'rubygems'
require 'bundler'
Bundler.require

root = ::File.dirname(__FILE__)
require ::File.join(root, 'app')
run TrackMe.new

# require './lib/initializer'
# require './lib/middleware'
# require './app'
# Mongoid.load!('config/mongoid.yml')

# #run Sinatra::Application
# run TrackMe