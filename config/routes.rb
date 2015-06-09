Rails.application.routes.draw do
  root 'images#index'

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
  end

  resources :images
  devise_for :users
  namespace :moderator do
    resources :images, only: [:show, :index, :destroy] do
      member do
        patch 'accept'
      end
    end
  end
  namespace :admin do
    resources :users, only: [:index] do
      member do
        patch 'ban'
        patch 'unban'
      end
    end
  end
end
