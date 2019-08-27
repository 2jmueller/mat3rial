Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:show, :index, :new]
  resources :items
  resources :transactions, except: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
