class TrackMe < Sinatra::Application
  get '/' do
    halt
  end

  get '/assets/javascripts/:file.js' do
    content_type :js
    settings.assets["#{params[:file]}.js"]
  end

  get '/assets/stylesheets/:file.css' do
    content_type :css
    settings.assets["#{params[:file]}.css"]
  end
end