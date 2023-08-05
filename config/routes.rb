Rails.application.routes.draw do
  root 'habits#index'
  get '/:view', to: 'habits#previewer', defaults: { view: 'daily' }, as: 'previewer'
  post '/habits', to: 'habits#create', as: 'create_habit'
  post '/habit/:id', to: 'habits#log_habit', as: 'log_habit'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
