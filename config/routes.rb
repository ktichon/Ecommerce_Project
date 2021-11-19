Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'books/index'
  resources :books, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :genres, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :cart, only: [:create, :destroy]
  root to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
