Rails.application.routes.draw do

  devise_for :users, :controllers => { :sessions => 'sessions' }

  resources :users, only: [:show] do
    resources :lists, only: [:create]
  end

  resources :lists, only: [:show, :destroy] do
    resources :items, only: [:create]
  end

  resources :items, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
