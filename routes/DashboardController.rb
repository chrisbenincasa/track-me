class TrackMe < Sinatra::Application
  before '/dashboard/*' do
    if logged_in == nil
      halt
    end
  end

  before '/dashboard/*' do
    if logged_in == nil
      halt
    end
  end

  get %r{/dashboard[/]?} do
    @user = session[:user]
    haml :dashboard, {:locals => {:user => @user}}
  end

  get '/dashboard/profile' do
    if (@user = logged_in) != nil
      haml :dashboard, :locals => {:user => @user}
    end
  end
end