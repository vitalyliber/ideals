Rails.application.routes.draw do
  root 'react#index'
  resources :categories do
    resources :products, only: [:index, :create]
  end
  resources :products, only: [:destroy]
  resources :categories, only: [:index, :create]
  get '*path', to: 'react#index'
end
