class RecipeController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipes/index_recipe'
  end

  get '/recipes/new' do
    erb :'/recipes/create_recipe'
  end

  post '/recipes/new' do
    @recipe = Recipe.create(params)
    # @recipe.user_id = current_user.id
    @recipe.save
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/edit_recipe'
  end

  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(params)
    @recipe.save
  end

  delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect '/recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/show_tweet'
  end
end
