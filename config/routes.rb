Rails.application.routes.draw do

  resources :admin_users, only:[:index, :new, :create, :edit, :update, :destroy, :show]
  resources :admin_accounts, only:[:edit, :update, :destroy, :show, :index, :save]

  get '/admin_account/approve/:id', to: 'admin_accounts#approve', as: :admin_account_approve
  get '/admin_account/deny/:id', to: 'admin_accounts#deny', as: :admin_account_deny

  get '/users/search', to: 'users#search'
  post '/users/search', to: 'users#search'



  devise_for :admins
  devise_for :users 

  resources :transactions
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

  post '/transaction/request_accept/:id', to: 'transactions#request_accept', as: :transaction_request_accept
  post '/transaction/request_decline/:id', to: 'transactions#request_decline', as: :transaction_request_decline
  post '/transaction/approve_transaction/:id', to: 'transactions#approve_transaction', as: :transaction_approve_transaction

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
