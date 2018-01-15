class JournalsController < ApplicationController

  get '/journals' do
     if logged_in?
       @user = current_user
       @journals = Journal.all
       erb :'journals/journals'
     else
       redirect to 'users/login'
     end
   end


   get '/journals/new' do

       if logged_in?
         erb :'journals/create_journal'
       else
         redirect '/login'
       end
     end

  post '/journals' do
    if params[:date].empty?
      redirect "/journals/new"
    else
      @journal = Journal.create(
        :date => params[:date],
        :content_greatful => params[:content_greatful],
        :content_today_great => params[:content_today_great],
        :content_affirmation => params[:content_affirmation],
        :content_amazing => params[:content_amazing],
        :content_better=> params[:content_better])
      @journal.user_id = current_user.id

      @journal.save
      redirect "/journals"
    end
  end

  get '/journals/:id' do
    if logged_in?
      @journal = Journal.find_by_id(params[:id])
      erb :'journals/show_journal'
    else
      redirect '/login'
    end
  end

  get '/journals/:id/edit' do
    @journal = Journal.find_by_id(params[:id])
    if logged_in?
      erb :'journals/edit_journal'
    else
      redirect '/login'
    end
  end

  patch '/journals/:id' do
    @journal = Journal.find_by_id(params[:id])
    unless params[:content].empty?
      @journal.content = params[:content]
      @journal.save
      erb :'journals/show_journal'
    else
      redirect "/journals/#{@journal.id}/edit"
    end
  end

  delete '/journals/:id/delete' do
    @journal = Journal.find_by_id(params[:id])
    if logged_in? && @journal.user_id == current_user.id
      @journal.delete
      redirect '/journals'
    else
      redirect '/login'
    end
  end
end
