Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cheeses, only: [:index, :map, :region, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookmarks, only: [:index]
  resources :users, only: [:edit, :update]
end
