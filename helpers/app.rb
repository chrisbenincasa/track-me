require 'sinatra'

helpers do 
  def is_user?
    @user != nil
  end
end