class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    Recipe.create(params)
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    binding.pry
    erb :show
  end

end
