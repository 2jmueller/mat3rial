Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :users, except: [:index, :new]
  resources :items
  get 'search', to: 'pages#search'
  # get 'search/filter', to: 'pages#filter'
  resources :transactions, except: [:edit, :update, :destroy]
end
