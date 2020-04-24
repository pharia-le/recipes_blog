class UsersController < ApplicationController


    get '/users/home' do
        @user = User.find_by_id(session[:user_id])
        binding.pry
        erb :'/users/home'
    end

    get '/registrations/signup' do
        erb :'/registrations/signup'
    end

    post '/registrations' do
        user = User.new(params[:user])
        user.save
        session[:user_id] = user.id 
        redirect '/users/home'
    end

    get '/sessions/login' do
        erb :'sessions/login'
    end

    get '/sessions/logout' do
        session.clear
        redirect '/'
    end

    post '/sessions' do
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect '/users/home'
        else
            redirect'/sessions/login'
        end
    end

end