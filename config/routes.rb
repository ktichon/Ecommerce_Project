Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  get 'books/index'
  resources :books, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :genres, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :cart, only: [:create, :update, :destroy]

  scope "/checkout" do
    post "create",  to: "checkout#create",  as: "checkout_create"
    get  "success", to: "checkout#success", as: "checkout_success"
    get  "cancel",  to: "checkout#cancel",  as: "checkout_cancel"
  end

  get "/checkout", to: "checkout#index"
  get "/cart", to: "cart#index"

  get "info_pages/:permalink" => "info_pages#permalink", as: "permalink"

  root to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
