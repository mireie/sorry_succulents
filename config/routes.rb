Rails.application.routes.draw do
  devise_for :users
  root to: 'about#index'
  resources :products do
    resources :reviews
  end
end
