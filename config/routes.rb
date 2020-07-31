Rails.application.routes.draw do
  root 'sessions#new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/setup', to: 'users#setup'
  patch '/setup', to: 'users#update'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'days#index'
  get '/days/:date', to: 'days#show'
  resources :days, only: [:update]

  resources :exercises, only: [:index, :create, :destroy]
  get '/days/:date/exercises/new', to: 'exercises#new'

  post '/days/:date/workouts', to: 'workouts#create'
  delete '/days/:date/workouts/:workout_id', to: 'workouts#destroy'

  resources :ingredients, only: [:index, :create]

  delete '/meals/:meal_id/ingredients/:ingredient_id', to: 'ingredients_meals#destroy'

  resources :meals, only: [:new, :index]
  get '/days/:date/meals/new', to: 'meals#new'
  post '/days/:date/meals', to: 'meals#create'
  get '/meals/:id/edit', to: 'meals#edit'
  #patch '/meals/:id', to: 'meals#update'
  delete 'meals/:id', to: 'meals#destroy'

  post '/days/:date/days_meals', to: 'days_meals#create'
  delete '/days/:date/meals/:meal_id', to: 'days_meals#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
