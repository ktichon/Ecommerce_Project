Rails.application.routes.draw do
  get 'genres/search'
  get 'genres/show'
  get 'authors/search'
  get 'authors/show'
  get 'books/index'
  get 'books/show'
  get 'books/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
