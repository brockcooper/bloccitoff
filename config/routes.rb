Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show], :as => :user do
    resources :lists, only: [:new, :create, :show, :index]
  end
  get 'welcome/index'
  get 'welcome/about'

  resources :todos, only: [:new, :create, :show]
  resources :lists, only: [:new, :create, :show]

  root to: 'welcome#index'
end
