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
    @chef = Chef.create(params)
    if @chef.valid?
      @chef.save
      session[:chef_id] = @chef.id
      redirect to '/recipes'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/recipes'
    else
      erb :'/chefs/login'
    end
  end

  post '/login' do
    @chef = Chef.find_by(name: params["name"])
    if @chef && @chef.authenticate(params["password"])
      session[:chef_id] = @chef.id
      redirect '/recipes'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end
