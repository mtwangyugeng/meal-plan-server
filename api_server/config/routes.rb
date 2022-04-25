Rails.application.routes.draw do
  
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/user", to: "users#user"
    resources :list_items
    resources :ingredients
    resources :recipes
    resources :recipe_ingredients
    resources :recipe_procedures
  end
end
