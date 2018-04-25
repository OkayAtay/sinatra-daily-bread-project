class ChefController < ApplicationController

  get '/' do
    erb :'/index'
  end

  get '/signup' do
    if logged_in?
      redirect to '/recipes'
    else
      erb :'/chefs/signup'
    end
  end

  post '/signup' do
    if params[:username] == ""|| params[:email] == ""|| params[:password] == ""
      redirect '/signup'
    else
      @chef = Chef.create(params)
      @chef.save
      session[:chef_id] = @chef.id
      redirect '/recipe/recipes'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/recipe/recipes'
    else
      erb :'/chefs/login'
    end
  end

  post '/login' do
    @chef = Chef.find_by(username: params["username"])
    if @chef && @chef.authenticate(params["password"])
      session[:chef_id] = @chef.id
      redirect '/recipes/recipes'
    else
      redirect '/chefs/login'
    end
  end

end
