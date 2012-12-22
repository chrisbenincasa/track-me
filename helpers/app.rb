require 'sinatra'

helpers do 
  def is_user?
    @user != nil
  end
  def logged_in
    if session[:user]
      return User.where(email: session[:user].email).first
    else
      return nil
    end
  end
  def logger
    request.logger
  end
end