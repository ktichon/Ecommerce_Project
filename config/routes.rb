Rails.application.routes.draw do
  get 'books/index'
  resources :books, only: [:index, :show, :search]
  resources :genres, only: [:index, :show, :search]
  resources :authors, only: [:index, :show, :search]
  root to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
