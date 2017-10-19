Rails.application.routes.draw do
  resources :orders
  namespace :account do
    resources :orders
  end
  devise_for :users
  root 'welcome#index'
end
