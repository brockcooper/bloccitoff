Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :todos, only: [:new, :create, :show]

  root to: 'welcome#index'
end
