class TrackMe < Sinatra::Application
  get '/' do
    halt
  end

  get '/js/templates/:file.js' do
    puts settings.assets.inspect
    content_type :js
    settings.assets["#{params[:file]}.js"]
  end

  get '/users' do
    redirect '/'
  end

  get '/users/signup' do
    haml :'user/signup', {:layout => :'layouts/layout_user'}
  end

  get '/users/signin' do
    haml :'user/signin', {:layout => :'layouts/layout_user'}
  end

  post '/users/signin' do
    email = params[:email]
    password = params[:password]
    @user = User.find_by(:email => email)
    if @user
      if BCrypt::Engine.hash_secret(password, @user.salt) == @user.password
        session[:user] = @user
        redirect '/dashboard'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
  end

  get '/users/signout' do
    if session[:user]
      session[:user] = nil
      redirect '/users/signin'
    else
      redirect '/'
    end
  end

  get '/users/current', :provides => 'json' do
    if (@user = logged_in) != nil
      trunc_user = @user.clone
      return trunc_user.to_json
    else
      return 'not logged in'
    end
  end

  get '/users/current/tracks', :provides => 'json' do
    if (@user = logged_in) != nil
      return @user.tracks.to_json
    else
      return 'not logged in', 302
    end
  end

  #create a user
  post '/users' do
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)
    if User.where(email: params[:email]).exists?
      redirect '/'
    else
      @user = User.new(:name => params[:name], 
        :salt => password_salt,
        :password => password_hash,
        :email => params[:email],
        :uid => User.count + 1
      )
      if @user.save
        session[:user] = @user
        redirect '/dashboard'
      else
        redirect '/users/signup'
      end
    end
  end

  get '/users/:id' do
    @user = User.find_by(uid: params[:id])
    haml :'user/user', {:layout => :'layouts/layout_user', :locals => {:name => @user.name}}
  end 
end