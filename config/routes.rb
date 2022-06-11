Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :login, only: :create
  resources :registration, only: :create
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
