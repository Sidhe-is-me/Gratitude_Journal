class UsersController < ApplicationController

  get '/signup' do
    # binding.pry
     if !logged_in?
        erb :'users/create_user'
      else
         redirect to '/journals'
       end

   end

   post '/signup' do
     if params[:username] == "" || params[:password] == "" || params[:email] == ""
        redirect to '/signup'
      else
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user.save

        session[:user_id] = @user.id
        redirect to '/journals'

       end
   end

   get '/login' do
     if logged_in?
      
       redirect to '/journals'
     else
       erb :'users/login'
     end
   end

   post '/login' do
     @user = User.find_by(username: params[:username])

     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/journals'
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

   get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'users/show'
    end



end
