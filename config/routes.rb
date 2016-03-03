Rails.application.routes.draw do

  get 'items/create'

  get 'items/create'

  devise_for :users, :controllers => { :sessions => 'sessions' }

  resources :users, only: [:show] do
    resources :lists, only: [:create, :destroy] do 
      resources :items, only: [:create, :destroy]
    end
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
