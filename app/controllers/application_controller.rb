require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  
  
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    
    if @user
      # line 18, is where the session is being created if the @user that comes from our helpers.rb, exists.
      session[:user_id] = @user.id
      
      redirect to '/account'
      
    else
      erb :error 
    end
  
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

