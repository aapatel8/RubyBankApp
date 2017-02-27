Rails.application.routes.draw do

  get '/users/search', to: 'users#search'
  post '/users/search', to: 'users#search'



  resources :transactions
  devise_for :admins
  devise_for :users 
  resources :accounts
  resources :users, only: [:new, :edit, :update, :delete]
  resources :admins, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :friendship, only: [:index, :create, :destroy]

  # We only need a show route for the dashboard. 
  # This correctly generates the helpers we need with :id
  resources :dashboard, only: [:show]

  get '/dashboard/', to: 'dashboard#show'
  
  resource :admin_dashboard, only: [:show]

  get '/request', to: 'request#index'

  root :to => 'dashboard#show'

  post '/transactions/request_accept', to: 'transactions#request_accept'
  post '/transactions/request_decline', to: 'transactions#request_decline'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
