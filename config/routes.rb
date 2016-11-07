Rails.application.routes.draw do
  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
    resoureses :destinations, only: [:index]
  end

  get '/dashboard', to: 'dashboard#index'
end
