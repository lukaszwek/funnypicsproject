Rails.application.routes.draw do
  root 'images#index'

  resources :images
  devise_for :users
end
