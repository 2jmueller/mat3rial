Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :users, except: [:index, :new]

  resources :items do
    resources :transactions, except: [:destroy]
  end

  get 'search', to: 'pages#search'
end
