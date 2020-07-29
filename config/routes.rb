Rails.application.routes.draw do
  get '/dashboard', to: 'days#index'
  get '/today', to: 'days#today'
  resources :days, only: [:show, :create, :edit, :update, :destroy]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  resources :exercises, only: [:create]
  resources :workouts
  resources :ingredients, only: [:create]
  resources :meals
  resources :days_meals, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
