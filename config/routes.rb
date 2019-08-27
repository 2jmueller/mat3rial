Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :users, except: [:show, :index, :new]
  resources :items
  resources :transactions, except: [:edit, :update, :destroy]
end
