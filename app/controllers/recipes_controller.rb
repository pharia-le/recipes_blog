class RecipesController < ApplicationController

    get '/recipes' do
        @categories = Category.all
        erb :'/recipes/index'
    end

    get '/recipes/new' do
        @user = current_user
        erb :'/recipes/new'
    end

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'/recipes/show'
    end

    get '/recipes/:id/edit' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'/recipes/edit'
    end

    patch '/recipes/:id' do
        recipe = Recipe.find_by_id(params[:id])
        recipe.update(params[:recipe])
        redirect "/recipes/#{recipe.id}"
    end

    post '/recipes' do
        binding.pry
        recipe = Recipe.create(params[:recipe])
        redirect "/recipes/#{recipe.id}"
    end

    delete '/recipes/:id' do
        Recipe.find_by_id(params[:id]).destroy
        redirect '/recipes'
    end
    
end