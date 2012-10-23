require 'rubygems'
require 'bundler'

Bundler.require

require './app'
require './lib/middleware'
Mongoid.load!('config/mongoid.yml')
require './lib/initializer'

run Sinatra::Application