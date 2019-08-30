
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  

  get '/' do
    redirect to "/articles"
  end
  
  
  get '/articles/new' do
    erb :new
  end
  
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
   # binding.pry
    @article.update(:title => params["edit_article_title"], :content => params["edit_article_content"])
    redirect to "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show_article
  end
  
  
  get '/articles' do
    @articles = Article.all
    erb :show
  end
  
  
  post '/articles' do
    @new_article = Article.new({:title => params["title"], :content => params["content"]})
    @new_article.save
    redirect "/articles/#{@new_article.id}"
  end
  
  delete '/articles/:id' do
    
  end
  
end
