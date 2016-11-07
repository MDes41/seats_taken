Rails.application.routes.draw do
  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create] do
    resources :destinations, only: [:index]
  end

  get '/dashboard', to: 'dashboard#index'
end
