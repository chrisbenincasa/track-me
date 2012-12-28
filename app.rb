require 'sinatra'

class TrackMe < Sinatra::Application
  enable :sessions
  set :session_secret, 'quantifyMeSecret'
  set :raise_errors, true
  set :views, File.path('./views')
  set :public_folder, File.path('./public')
  set :assets, Sprockets::Environment.new(File.path('../'))

  use Rack::Logger
  use Rack::MethodOverride

  if ENV['RACK_ENV'] == 'development'
    
  end

  # use Sass::Plugin::Rack
  # Sass::Plugin.options[:load_paths] = ['public/stylesheets']

  # use Rack::Coffee, {
  #   :root => 'public',
  #   :urls => '/js',
  #   #:cache_compile => true
  #   #:urls => ['/js/collections', '/js/models', '/js/routes', '/js/views']
  # }

  # Sprockets asset packaging for haml-js infused JST
  settings.assets.register_engine '.hamljs', RubyHamlJs::Template
  settings.assets.append_path(File.join(File.dirname(__FILE__), 'assets', 'javascripts'))
  settings.assets.append_path(File.join(File.dirname(__FILE__), 'assets', 'stylesheets'))
  settings.assets.append_path(File.join(File.dirname(__FILE__), 'assets', 'jst'))

  configure :development do
    use Rack::Reloader
  end

  configure :production do
    set :haml, {:ugly => true}
    set :clean_trace, true
    #settings.assets.css_compressor = SassCompressor.new
    settings.assets.js_compressor = Uglifier.new
    settings.assets.debug = true
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'