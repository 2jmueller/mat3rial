Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :users, except: [:show, :index, :new]
  resources :items
  get 'search', to: 'pages#search'
  resources :transactions, except: [:edit, :update, :destroy]
end
