Rails.application.routes.draw do
  root 'habits#previewer'
  get '/', to: 'habits#previewer', as: 'previewer'
  get '/habits/edit', to: 'habits#edit', as: 'edit_habits'
  get '/profile', to: 'dashboard#current_user_profile', as: 'profile'
  get 'reports', to: 'habits#habit_reports', as: 'habit_reports'
  post '/habits', to: 'habits#create', as: 'create_habit'
  post '/habit/:id', to: 'habits#log_habit', as: 'log_habit'
  delete '/habit/:id', to: 'habits#delete_habit', as: 'delete_habit'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
