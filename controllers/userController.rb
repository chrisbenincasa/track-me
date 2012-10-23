require 'bcrypt'
require './models/user'

get '/users' do
  if(@user = logged_in) != nil
    @track = Track.new(:tid => Track.count + 1, 
      :date_created => DateTime.now(),
      :name => 'Default'
    )
    @user.tracks << @track
  end
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
  haml :'user/signout', {:layout => :'layouts/layout_user'}
end

post '/users/signout' do
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

post '/users' do
  #create a user
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
      session[:user] = email
      session[:password] = password_hash
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