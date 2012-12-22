require 'sinatra'
require 'sass/plugin/rack'
require 'rack/coffee'

enable :sessions
set :session_secret, 'quantifyMeSecret'
set :raise_errors, true
set :views, File.path('./views')
set :public_folder, File.path('./public')

use Rack::Logger
use Rack::MethodOverride

if ENV['RACK_ENV'] == 'development'
  use Rack::Reloader
end

use Sass::Plugin::Rack
Sass::Plugin.options[:load_paths] = ['public/stylesheets']

use Rack::Coffee, {
  :root => 'public',
  :urls => '/js',
  #:cache_compile => true
  #:urls => ['/js/collections', '/js/models', '/js/routes', '/js/views']
}

# assets = Sprockets::Environment.new(File.path('../')) do |env|
#   env.logger = Logger.new(STDOUT)
# end

# assets.append_path(File.join(File.path('../'), 'app', 'assets'))
# assets.append_path(File.join(File.path('../'), 'app', 'assets', 'javascripts'))
# assets.append_path(File.join(File.path('../'), 'app', 'assets', 'stylesheets'))