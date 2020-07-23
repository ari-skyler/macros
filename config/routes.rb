Rails.application.routes.draw do
  get '/dashboard', to: 'days#index'
  get '/today', to: 'days#today'
  resources :days, only: [:show, :create, :edit, :update, :destroy]
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :exercises, only: [:create]
  resources :workouts
  resources :ingredients, only: [:create]
  resources :meals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
