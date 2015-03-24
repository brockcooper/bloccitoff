Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show], :as => :user
  get 'welcome/index'
  get 'welcome/about'

  resources :todos, only: [:new, :create, :show]

  root to: 'welcome#index'
end
