require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do

    def logged_in?
      !!session[:chef_id]
    end

    def current_user
      @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
    end

  end

end
