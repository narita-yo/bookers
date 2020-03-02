Rails.application.routes.draw do
  get 'home/about', to: 'home#about'
  get 'user/login', to: 'users#login'
  #get '/', to: 'home#index'
  root to: 'home#index'

  devise_for :users
  resources :users, :only => [:index, :show, :update, :edit]
  resources :books
  resources :profiles, only: [:new, :create, :index, :show]
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
