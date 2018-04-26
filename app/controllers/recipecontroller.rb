class RecipeController < ApplicationController

  get '/recipes' do
    @recipes = Recipe.all
  end

  get '/recipes/new' do
    erb :'/recipes/create_recipe'
  end

  post '/recipes/new' do
    binding.pry
    @recipe = Recipe.create(params)
    # @recipe.user_id = current_user.id
    @recipe.save
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/edit_recipe'
  end

  patch '/recipes/:id/edit' do

  end
end
