Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "result", to: "pages#result", as: "result"
  get '/reload_page', to: 'pages#reload_page', as: 'reload_page'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cheeses, only: [:index, :map, :region, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookmarks, only: [:index, :create]

  get "userprofiles/question_1" => "userprofiles#question_1", as: "question_1"
  get "userprofiles/question_2" => "userprofiles#question_2", as: "question_2"
  get "userprofiles/question_3" => "userprofiles#question_3", as: "question_3"
  get "userprofiles/profil" => "userprofiles#show", as: "show"

  patch "userprofiles/question_1" => "userprofiles#update"
  patch "userprofiles/question_2" => "userprofiles#update"
  patch "userprofiles/question_3" => "userprofiles#update"
  patch "userprofiles/profil" => "userprofiles#update"
end
