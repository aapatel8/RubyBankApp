Rails.application.routes.draw do

  get '/users/search', to: 'users#search'
  post '/users/search', to: 'users#search'


  resources :transactions
  devise_for :admins
  devise_for :users
  resources :accounts
  resources :users
  resources :friends

  # We only need a show route for the dashboard. 
  # This correctly generates the helpers we need with :id
  resources :dashboard, only: [:show]

  get '/dashboard/', to: 'dashboard#show'
  
  resource :admin_dashboard, only: [:show]

  get '/request', to: 'request#index'

  root :to => 'dashboard#show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
