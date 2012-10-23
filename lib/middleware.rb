require 'sass/plugin/rack'
require 'rack/coffee'

use Rack::MethodOverride

use Sass::Plugin::Rack
Sass::Plugin.options[:load_paths] = ['public/stylesheets']

use Rack::Coffee, {
  :root => 'public',
  :urls => '/js',
  #:cache_compile => true
  #:urls => ['/js/collections', '/js/models', '/js/routes', '/js/views']
}