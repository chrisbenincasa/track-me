class TrackMe < Sinatra::Application
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
      user_return_hash = @user.attributes
      user_return_hash.delete_if { |e| e == "password" || e == "salt" }
      return user_return_hash.to_json
    else
      return 'not logged in'
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