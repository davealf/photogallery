Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  get "upload" => "images#new", :as => "upload"
  get 'images/create'
  get 'images/destroy'
  get 'images/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :images, :categories

  root 'images#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
