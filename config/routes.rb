Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show], :as => :user do
    resources :lists, only: [:new, :create, :show, :destroy] do
      resources :todos, only: [:create, :destroy] 
    end
  end

  namespace :api, defaults: { format: :json} do
    resources :users do 
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]
  end



  get 'welcome/index'
  get 'welcome/about'

  resources :todos, only: [:create, :destroy]
  resources :lists, only: [:create, :destroy]

  root to: 'welcome#index'
end
