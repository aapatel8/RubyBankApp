Rails.application.routes.draw do
  resources :transactions
  devise_for :admins
  devise_for :users
  resources :accounts
  resources :users

  get '/dashboard', to: 'dashboard#show'

  root :to => 'dashboard#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
