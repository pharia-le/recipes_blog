class RecipesController < ApplicationController

    get '/recipes' do
        @recipes = Recipe.all
        erb :'/recipes/index'
    end

    get '/recipes/new' do
        erb :'/recipes/new'
    end

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'/recipes/show'
    end

    post '/recipes' do
        recipe = Recipe.create(params[:recipe])
        redirect "/recipes/#{recipe.id}"
    end

    delete '/recipes/:id' do
        Recipe.find_by_id(params[:id]).destroy
        redirect '/recipes'
    end
    
end