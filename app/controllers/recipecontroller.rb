class RecipeController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    if logged_in?
      current_user = @chef
      erb :'/recipes/index_recipe'
    else
      redirect '/login'
    end
  end

  get '/recipes/new' do
    if logged_in?
      erb :'/recipes/create_recipe'
    else
      redirect '/login'
    end
  end

  post '/recipes' do
    if logged_in?
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], time: params[:time], weekday: params[:weekday], chef_id: session.chef_id)
      binding.pry
      @recipe.chef = current_user
      @recipe.save
      redirect '/recipes'
    end
  end

  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && @recipe.chef == current_user
        erb :'/recipes/edit_recipe'
      else
        redirect '/login'
      end
    end
  end

  patch '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.update(name: params[:name], ingredients: params[:ingredients], time: params[:time], weekday: params[:weekday])
      @recipe.save
      redirect '/recipes'
    else
      redirect '/login'
    end
  end

  delete '/recipes/:id/delete' do
    @recipe = current_user.recipes.find_by(id: params[:id])
    if @recipe && @recipe.destory
      @recipe.delete
      redirect '/recipes'
    else
      redirect '/recipes/#{@recipe.id}'
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/show_recipe'
  end
end
