require 'rack-flash'
class UsersController < ApplicationController
use Rack::Flash
  get '/signup' do
    # binding.pry
     if !logged_in?

        erb :'users/create_user'
      else
         redirect to '/journals'
       end

   end

   post '/signup' do
     @user = User.create(username: params[:username], email: params[:email], password: params[:password])

     if  !@user.valid?
       flash[:message] = " Entry Invalid: Please enter name, unique email & password to create a account"

        redirect to '/signup'
      else

        flash[:message] = "Account Created"

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
       flash[:message] = "You have logged out"
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
