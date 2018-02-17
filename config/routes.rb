Rails.application.routes.draw do
  resources :categories do
    resources :products, only: [:index, :create]
  end
  resources :products, only: [:destroy]
  resources :categories, only: [:index, :create]
end
